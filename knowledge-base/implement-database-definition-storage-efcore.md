---
title: Implementing an EFCore IDefinitionStorage
description: "Learn how to create a custom IDefinitionStorage in Telerik Reporting that stores reports in a database using EntityFramework Core."
type: how-to
page_title: MSSQL Server database as Reports Storage for Web Report Designer
slug: implement-database-definition-storage-efcore
tags: Web Report Designer
ticketid: 1600996
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<th scope="row">Product Version</th>
			<td>16.2.22.1109+</td>
		</tr>
		<tr>
			<th scope="row">Project Type</th>
			<td>ASP.NET Core</td>
		</tr>
	</tbody>
</table>

## Description

Out of the box, Telerik Reporting offers the [FileDefinitionStorage](/api/telerik.webreportdesigner.services.filedefinitionstorage) class which can be used to store the [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview) report definitions in a local directory.

In certain cases, one may want to instead store the report definitions in a custom place, for example, a database. For this reason, we have exposed the [IDefinitionStorage](/api/Telerik.WebReportDesigner.Services.IDefinitionStorage) interface. By implementing this interface, one will be able to store the report definitions in any place, be it SQL or NoSQL database, [Azure Blob Storage](https://azure.microsoft.com/en-us/products/storage/blobs/), etc.

In this article, we will demonstrate how the report definitions can be stored in a MSSQL Server database using [Entity Framework Core](https://learn.microsoft.com/en-us/ef/core/).

## Solution

The implementation has seven steps:

- [Define the database models](#define-the-database-models) for reports and folders.
- [Create the database context](#create-the-database-context) for queries and updates.
- [Map database models to designer models](#map-database-models-to-designer-models).
- [Implement the definition storage](#implement-the-definition-storage) for report and folder operations.
- [Resolve reports for preview](#resolve-reports-for-preview).
- [Resolve subreports and drillthrough reports](#resolve-subreports-and-drillthrough-reports).
- [Register the storage and resolvers](#register-the-storage-and-resolvers) with the application services.

The code blocks show related parts of one implementation, not separate standalone programs. Use the [sample project](#sample-project) for the application structure.

### Define the Database Models

Create Entity Framework Core models for the report definitions and their folders. These models will be used later to create database tables. The `Report` model stores the report bytes and metadata:

```C#
	public class Report
	{
		[Column("Id")]
		[Required]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		[Key]
		public string Id { get; set; }

		[Column("Name")]
		[Required]
		public string Name { get; set; }

		[Column("Bytes")]
		[Required]
		public byte[] Bytes { get; set; }

		[Column("CreatedOn")]
		[Required]
		public DateTime CreatedOn { get; set; }

		[Column("ModifiedOn")]
		public DateTime ModifiedOn { get; set; }

		[Column("Size")]
		public float Size { get; set; }

		[Column("ParentUri")]
		public string ParentUri { get; set; }

		[Column("Uri")]
		public string Uri { get; set; }
	}
```

The `ReportFolder` model stores folder metadata and parent-child relationships:

```C#
	public class ReportFolder
	{

		[Column("Id")]
		[Required]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		[Key]
		public string Id { get; set; }

		[Column("Name")]
		[Required]
		public string Name { get; set; }

		[Column("ParentUri")]
		[Required]
		public string ParentUri { get; set; }

		[Column("HasSubFolders")]
		public bool HasSubFolders { get; set; }

		[Column("Uri")]
		public string Uri { get; set; }

		[Column("CreatedOn")]
		[Required]
		public DateTime CreatedOn { get; set; }

		[Column("ModifiedOn")]
		public DateTime ModifiedOn { get; set; }
	}
```

### Create the Database Context

Create a custom [`DbContext`](https://learn.microsoft.com/en-us/ef/core/dbcontext-configuration/) for querying and saving data in the definition storage implementation.

The following `SqlDefinitionStorageContext` exposes the report and folder collections. The connection string targets a local SQL Server Express `DefinitionStorage` database; use connection settings appropriate for your environment. The service registration in step 7 creates the tables with `EnsureCreated`.

```C#
	using CSharp.Net7.Html5IntegrationDemo.EFCore.Models;
	using Microsoft.EntityFrameworkCore;
	
	namespace CSharp.Net7.Html5IntegrationDemo.EFCore
	{
		public class SqlDefinitionStorageContext : DbContext
		{
			public DbSet<Report> Reports { get; set; }

			public DbSet<ReportFolder> ReportFolders { get; set; }

			public SqlDefinitionStorageContext(DbContextOptions<SqlDefinitionStorageContext> options) : base(options) { }

			protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
			{
				if (!optionsBuilder.IsConfigured)
				{
					var connenctionString = @"Server=.\SQLEXPRESS;Database=DefinitionStorage;Trusted_Connection=True;TrustServerCertificate=True;";
					optionsBuilder.UseSqlServer(connectionString);
				}
			}
		}
	}
```

### Map Database Models to Designer Models

Use the following extension class to convert between database models and [Telerik.WebReportDesigner.Services.Models](/api/telerik.webreportdesigner.services.models). The methods map report and folder metadata and create database entities from save and create-folder requests:

```C#
	using System;
	using Telerik.WebReportDesigner.Services.Models;

	namespace CSharp.Net7.Html5IntegrationDemo.EFCore.Models
	{
		public static class DbModelExtensions
		{
			public static ResourceFileModel ToResourceFileModel(this EFCore.Models.Report dbReportModel)
			{
				if (dbReportModel == null)
				{
					return null;
				}

				return new ResourceFileModel()
				{
					FileName = dbReportModel.Name,
					ParentPath = dbReportModel.ParentUri,
					Uri = dbReportModel.Uri,
					Size = dbReportModel.Bytes.Length / 1024f,
					CreatedOn = dbReportModel.CreatedOn,
					ModifiedOn = dbReportModel.ModifiedOn,
				};
			}

			public static ResourceFolderModel ToResourceFolderModel(this EFCore.Models.ReportFolder dbReportFolderModel)
			{
				if (dbReportFolderModel == null)
				{
					return null;
				}

				return new ResourceFolderModel()
				{
					Name = dbReportFolderModel.Name,
					ParentUri = dbReportFolderModel.ParentUri,
					HasSubFolders = dbReportFolderModel.HasSubFolders,
					CreatedOn = dbReportFolderModel.CreatedOn,
					ModifiedOn = dbReportFolderModel.ModifiedOn,
					Uri = dbReportFolderModel.Uri
				};
			}

			public static EFCore.Models.ReportFolder ToDbReportFolderModel(this CreateFolderModel createFolderModel)
			{
				return new EFCore.Models.ReportFolder() {
					Name = createFolderModel.Name,
					ParentUri = createFolderModel.ParentUri,
					Uri = (string.IsNullOrEmpty(createFolderModel.ParentUri)
						? createFolderModel.ParentUri
						: createFolderModel.ParentUri + "\\") + createFolderModel.Name,
					CreatedOn = DateTime.Now,
					ModifiedOn = DateTime.Now
				};
			}

			public static EFCore.Models.Report ToDbReportModel(this SaveResourceModel saveResourceModel, byte[] data)
			{
				return new Models.Report()
				{
					Name = saveResourceModel.Name,
					Bytes = data,
					ParentUri = saveResourceModel.ParentUri,
					Uri = (string.IsNullOrEmpty(saveResourceModel.ParentUri)
						? saveResourceModel.ParentUri
						: saveResourceModel.ParentUri + "\\") + saveResourceModel.Name,
					Size = data.Length,
					CreatedOn = DateTime.Now,
					ModifiedOn = DateTime.Now
				};
			}
		}
	}
```

### Implement the Definition Storage

Implement the [IDefinitionStorage](/api/Telerik.WebReportDesigner.Services.IDefinitionStorage) interface with the database context and mapping methods from the previous steps.

The following focused excerpt shows the read operation from `CustomDefinitionStorage`. `GetAsync` normalizes the resource URI and retrieves the stored report bytes. It throws `ReportNotFoundException` when no bytes are found. This method belongs to the complete class below; do not add it a second time.

```C#
	public Task<byte[]> GetAsync(string resourceName)
	{
		var reportBytes = this.GetDbReportModel(this.PrepareResourceUri(resourceName))?.Bytes;
		return reportBytes == null ? throw new ReportNotFoundException() : Task.FromResult(reportBytes);
	}
	```

	The complete implementation follows. Its methods create, list, rename, save, and delete reports and folders. The helper methods normalize URIs and update or delete nested folder contents:

	```C#
	using CSharp.Net7.Html5IntegrationDemo.EFCore;
	using Microsoft.EntityFrameworkCore;
	using System.Linq;
	using System.Collections.Generic;
	using System.Threading.Tasks;
	using Telerik.WebReportDesigner.Services;
	using Telerik.WebReportDesigner.Services.Models;
	using CSharp.Net7.Html5IntegrationDemo.EFCore.Models;
	using Microsoft.Extensions.DependencyInjection;
	using System;

	namespace CSharp.Net7.Html5IntegrationDemo
	{
		public class CustomDefinitionStorage : IDefinitionStorage
		{
			private SqlDefinitionStorageContext _dbContext { get; }

			public CustomDefinitionStorage(SqlDefinitionStorageContext context)
			{
				this._dbContext = context;
			}

			public Task<ResourceFolderModel> CreateFolderAsync(CreateFolderModel model)
			{

				if(this._dbContext.ReportFolders.Any(f => f.Uri == model.ParentUri + "\\" + model.Name)) {
					throw new ResourceFolderAlreadyExistsException();
				}

				var entityEntry = this._dbContext.ReportFolders.Add(model.ToDbReportFolderModel());

				if (!string.IsNullOrEmpty(model.ParentUri))
				{
					var parentFolder = this._dbContext.ReportFolders
					.FirstOrDefault(f => f.Uri == model.ParentUri);

					if (parentFolder != null)
					{
						parentFolder.HasSubFolders = true;
					}
				}

				this._dbContext.SaveChanges();

				return Task.FromResult(entityEntry.Entity.ToResourceFolderModel());
			}

			public Task DeleteAsync(string uri)
			{
				var report = this._dbContext.Reports
						.FirstOrDefault(r => r.Uri == this.PrepareResourceUri(uri)) ?? throw new ReportNotFoundException();
				this._dbContext.Reports.Remove(report);
				this._dbContext.SaveChanges();
				return Task.CompletedTask;
			}

			public Task DeleteFolderAsync(string uri)
			{
				try
				{
					var folderForDeletion = this._dbContext.ReportFolders.FirstOrDefault(f => f.Uri == uri);
					var parentUri = folderForDeletion.ParentUri;
					if (folderForDeletion != null)
					{
						DeleteFolder(folderForDeletion);
						this._dbContext.SaveChanges();
						var subFoldersCount = this._dbContext.ReportFolders.Count(f => f.ParentUri == parentUri);
						if (subFoldersCount > 0)
						{
							var parentFolderName = parentUri.Split("\\").Last();
							var parentFolder = this._dbContext.ReportFolders.FirstOrDefault(f => f.Name == parentFolderName);
								if(parentFolder != null) parentFolder.HasSubFolders = false;
							this._dbContext.SaveChanges();
						}
						return Task.CompletedTask;
					}
					return Task.FromException(new ResourceFolderNotFoundException());
				}
				catch (Exception)
				{
					throw;
				}

			}

			public Task<byte[]> GetAsync(string resourceName)
			{
				var reportBytes = this.GetDbReportModel(this.PrepareResourceUri(resourceName))?.Bytes;
				return reportBytes == null ? throw new ReportNotFoundException() : Task.FromResult(reportBytes);
			}

			public Task<ResourceFolderModel> GetFolderAsync(string uri)
			{
				// it is not necessar to implement this one
				var folder = this._dbContext.ReportFolders.FirstOrDefault(f => f.Uri == uri);
				return folder == null
					? throw new ResourceFolderNotFoundException()
					: Task.FromResult(folder.ToResourceFolderModel());
			}

			public Task<IEnumerable<ResourceModelBase>> GetFolderContentsAsync(string uri)
			{
				uri = (uri ?? string.Empty);

				var reps = this._dbContext.Reports
					.Where(r => r.ParentUri == uri)
					.Select(r => r.ToResourceFileModel()).AsEnumerable<ResourceModelBase>();

				var folders = this._dbContext.ReportFolders
					.Where(f => f.ParentUri == uri)
					.Select(f => f.ToResourceFolderModel()).AsEnumerable<ResourceModelBase>();

				var result = folders.Union(reps);

				return Task.FromResult<IEnumerable<ResourceModelBase>>(result);
			}

			public Task<ResourceFileModel> GetModelAsync(string uri)
			{
				return Task.FromResult(
					this.GetDbReportModel(uri)
							.ToResourceFileModel());
			}

			public Task<ResourceFileModel> RenameAsync(RenameResourceModel model)
			{
				string oldName = model.OldUri.Split("\\").Last();
				var report = this._dbContext.Reports.FirstOrDefault(r => r.Uri == this.PrepareResourceUri(model.OldUri));
				if (report != null)
				{
					report.Name = model.Name;
					report.Uri = report.Uri.Replace(oldName, model.Name);
					report.ModifiedOn = DateTime.Now;

					this._dbContext.SaveChanges();

					return Task.FromResult(report.ToResourceFileModel());
				}
				throw new ResourceNotFoundException();
			}

			public async Task<ResourceFolderModel> RenameFolderAsync(RenameFolderModel model)
			{
				var folder = this._dbContext.ReportFolders.FirstOrDefault(r => r.Uri == model.OldUri);
				if (folder != null)
				{
					await RenameFolderAndSubFolders(folder, model);
					folder.ModifiedOn = DateTime.Now;
					this._dbContext.SaveChanges();

					return folder.ToResourceFolderModel();
				}
				throw new ResourceFolderNotFoundException();
			}

			public Task<ResourceFileModel> SaveAsync(SaveResourceModel model, byte[] resource)
			{
				var entity = this._dbContext.Reports.FirstOrDefault(r => r.Uri == model.ParentUri + model.Name);

				if (entity != null)
				{
					entity.Bytes = resource;
					entity.ModifiedOn = DateTime.Now;
					this._dbContext.SaveChanges();
					return Task.FromResult(entity.ToResourceFileModel());
				}

				var entityEntry = this._dbContext.Reports.Add(model.ToDbReportModel(resource));
				this._dbContext.SaveChanges();

				return Task.FromResult(entityEntry.Entity.ToResourceFileModel());
			}

			string PrepareResourceUri(string resourceName)
			{
				resourceName = (resourceName ?? string.Empty);
				resourceName = resourceName.Replace("/", "\\");

				return resourceName;
			}

			EFCore.Models.Report GetDbReportModel(string uri)
			{
				if (_dbContext.Reports.Any())
				{
					return this._dbContext.Reports.FirstOrDefault(r => r.Uri == uri);
				}

				return null;
			}

			void DeleteReportsInFolder(ReportFolder folder)
			{
				var reports = this._dbContext.Reports.Where(r => r.ParentUri == folder.Uri).ToList();
				if (reports.Count > 0)
				{
					reports.ForEach(r =>
					{
						this._dbContext.Reports.Remove(r);
						this._dbContext.SaveChanges();
					});
				}
			}

			void DeleteFolder(ReportFolder folder)
			{
				DeleteReportsInFolder(folder);

				var subfolders = this._dbContext.ReportFolders.Where(f => f.ParentUri == folder.Uri).ToList();
				this._dbContext.ReportFolders.Remove(folder);

				if (subfolders.Count == 0)
				{
					return;
				}

				foreach (var subfolder in subfolders)
				{
					DeleteFolder(subfolder);
				}
			}

			async Task UpdateReportParentUriAfterFolderRename(string oldName, RenameFolderModel model)
			{
				await this._dbContext.Reports.ForEachAsync(r =>
				{
					if (r.ParentUri.Contains(model.OldUri))
					{
						r.Uri = r.Uri.Replace(oldName, model.Name);
						r.ParentUri = r.ParentUri.Replace(oldName, model.Name);
					}
				});
			}

			async Task RenameFolderAndSubFolders(ReportFolder folder, RenameFolderModel model)
			{
				string oldName = model.OldUri.Split("\\").Last();

				await UpdateReportParentUriAfterFolderRename(oldName, model);

				folder.Name = model.Name;
				folder.Uri = folder.Uri.Replace(oldName, model.Name);

				if (!folder.HasSubFolders)
				{
					return;
				}

				await this._dbContext.ReportFolders
					.Where(f => f.ParentUri.Contains(model.OldUri))
					.ForEachAsync(f =>
					{
						f.Uri = f.Uri.Replace(oldName, model.Name);
						f.ParentUri = f.ParentUri.Replace(oldName, model.Name);
					});
			}
		}
	}
```

### Resolve Reports for Preview

Implement [IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver) to preview reports stored in the database. The following class looks up the report by URI, unpackages its bytes, and returns an `InstanceReportSource`:

```C#
	public class CustomReportSourceResolver : IReportSourceResolver
	{

		private SqlDefinitionStorageContext _dbContext { get; }
		public CustomReportSourceResolver(SqlDefinitionStorageContext context)
		{
			this._dbContext = context;
		}

		public ReportSource Resolve(string uri, OperationOrigin operationOrigin, IDictionary<string, object> currentParameterValues)
		{
			var reportPackager = new ReportPackager();
			var report = this._dbContext.Reports.FirstOrDefault(r => r.Uri == uri.Replace("/", "\\"));

			if (report == null)
			{
				throw new FileNotFoundException();
			}

			MemoryStream stream = new(report.Bytes);
			Telerik.Reporting.Report report1 = (Telerik.Reporting.Report)reportPackager.UnpackageDocument(stream);

			var instanceReportSource = new InstanceReportSource
			{
				ReportDocument = report1
			};

			return instanceReportSource;
		}
	}
```

### Resolve Subreports and Drillthrough Reports

For [`SubReports`](slug:telerikreporting/designing-reports/report-structure/subreport) and [`NavigateToReport`](slug:telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action) actions, the engine also uses a `ReportDocumentResolver`. The default resolver looks up reports by URI rather than querying this database. The following custom implementation returns the main report from its `InstanceReportSource` and retrieves reports referenced by `UriReportSource` from the database:

```CSharp
	using Microsoft.EntityFrameworkCore;
	using SqlDefinitionStorageExample.EFCore;
	using System;
	using System.IO;
	using System.Linq;
	using Telerik.Reporting;
	using Telerik.Reporting.Services;

	namespace SqlDefinitionStorageExample
	{
		public class CustomReportDocumentResolver : IReportDocumentResolver
		{
			public IReportDocument Resolve(ReportSource reportSource)
			{
				// The main report is wrapped in an InstanceReportSource by CustomReportSourceResolver
				if (reportSource is InstanceReportSource)
				{
					return (reportSource as InstanceReportSource).ReportDocument;
				}
				// the subreport is resolved in the context of the main report SubReport
				else if (reportSource is UriReportSource)
				{
					var reportPackager = new ReportPackager();
					var uri = (reportSource as UriReportSource).Uri.Replace(AppDomain.CurrentDomain.BaseDirectory, string.Empty);
					var optionsBuilder = new DbContextOptionsBuilder<SqlDefinitionStorageContext>();

					// It is necessary to initialize a new dbContent because this code will be executed in a new thread
					using SqlDefinitionStorageContext dbContext = new(optionsBuilder.Options);
					var report = dbContext.Reports.FirstOrDefault(r => r.Uri == uri) ?? throw new FileNotFoundException();
					MemoryStream stream = new(report.Bytes);
					return reportPackager.UnpackageDocument(stream);
				}
				return null;
			}
		}
	}
```

### Register the Storage and Resolvers

Register `CustomDefinitionStorage`, `CustomReportSourceResolver`, and `CustomReportDocumentResolver` with the application services. The following startup code assigns them to the report service configuration and [ReportDesignerServiceConfiguration](/api/Telerik.WebReportDesigner.Services.ReportDesignerServiceConfiguration), then creates the database tables. `reportsPath` points to the sample project's Report Designer examples directory; adjust it to match your directory structure.

```C#
	var builder = WebApplication.CreateBuilder(args);

	// Add services to the container.
	builder.Services.AddControllers();
	builder.Services.AddRazorPages();

	// Add the custom resolvers and storages
	builder.Services.AddDbContext<SqlDefinitionStorageContext>();
	builder.Services.AddScoped<IDefinitionStorage, CustomDefinitionStorage>();
	builder.Services.AddScoped<IReportSourceResolver, CustomReportSourceResolver>();
	builder.Services.AddScoped<IReportDocumentResolver, CustomReportDocumentResolver>();

	var reportsPath = Path.Combine(builder.Environment.ContentRootPath, "..", "..", "..", "..", "Report Designer", "Examples");
	
	// Configure dependencies for ReportsController.
	builder.Services.TryAddScoped<IReportServiceConfiguration>(sp =>
		new ReportServiceConfiguration
		{
			// The default ReportingEngineConfiguration will be initialized from appsettings.json or appsettings.{EnvironmentName}.json:
			ReportingEngineConfiguration = sp.GetService<IConfiguration>(),

			// In case the ReportingEngineConfiguration needs to be loaded from a specific configuration file, use the approach below:
			//ReportingEngineConfiguration = ResolveSpecificReportingConfiguration(sp.GetService<IWebHostEnvironment>()),
			HostAppId = "SqlDefinitionStorageExample",
			Storage = new FileStorage(),
			// Using the custom resolver implementations
			ReportSourceResolver = sp.GetRequiredService<IReportSourceResolver>(),
			ReportDocumentResolver = sp.GetRequiredService<IReportDocumentResolver>()
		});

	// Configure dependencies for ReportDesignerController.
	builder.Services.TryAddScoped<IReportDesignerServiceConfiguration>(sp => new ReportDesignerServiceConfiguration
	{
		DefinitionStorage =sp.GetRequiredService<IDefinitionStorage>(),
		ResourceStorage = new ResourceStorage(Path.Combine(reportsPath, "Resources")),
		SharedDataSourceStorage = new FileSharedDataSourceStorage(Path.Combine(reportsPath, "Shared Data Sources")),
		SettingsStorage = new FileSettingsStorage(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Telerik Reporting"))
	});

	var app = builder.Build();

	using (var serviceScope = app.Services.CreateScope())
	{
		serviceScope.ServiceProvider
			.GetService<SqlDefinitionStorageContext>()
			.Database
			.EnsureCreated();
	}
```

## Notes

Since there will be no data in the database, initially, the [ReportNotFoundException](/api/telerik.webreportdesigner.services.reportnotfoundexception) will be thrown a couple of times, you can safely `Continue` until you see the Web Report Designer loaded with no report. At this point, you can now create a new report from the main menu.

One way to avoid this would be to, manually, insert a sample report when the application is started if the database table for the reports is empty.

The following `ReportsInitializer` extension class inserts a sample report when the reports table is empty. `pathToSampleReport` represents the path to an existing TRDP report file; define it in your application before using this code.

```C#
public static class ReportsInitializer
	{
		public static WebApplication Seed(this WebApplication app)
		{
			using var scope = app.Services.CreateScope();
			var context =  scope.ServiceProvider.GetRequiredService<SqlDefinitionStorageContext>();

			try {

				if (!context.Reports.Any())
				{
						var saveResourceModel = new SaveResourceModel()
						{
							Name = "SampleReport.trdp",
							ParentUri = string.Empty
						};

						var reportBytes = System.IO.File.ReadAllBytes(pathToSampleReport);
						var entity = saveResourceModel.ToDbReportModel(reportBytes);

						context.Reports.Add(entity);
						context.SaveChanges();
				}

				return app;
			}
			catch (Exception)
			{
				throw;
			}
		}
	}
```

In `Program.cs`, call `app.Seed()` before `app.Run()` to insert the sample report before the application starts handling requests:

```C#
// Add initial data to database
	app.Seed();

	app.Run();
```

## Sample Project

- [SqlDefinitionStorageExample](https://github.com/telerik/reporting-samples/tree/master/SqlDefinitionStorageExample)

## See Also

- [Using Custom Report Definition Storage](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-implement-a-report-definition-storage)
- [Implementing Custom ReportSource and ReportDocument Resolvers](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-use-custom-report-source-resolver-and-custom-report-document-resolver)
