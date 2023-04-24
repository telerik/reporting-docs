---
title: Implementing an EFCore IDefinitionStorage
description: "Learn how to create a custom IDefinitionStorage in Telerik Reporting that stores reports in a database using EntityFramework Core."
type: how-to
page_title: Using an MSSQL Server database as Reports Storage for Web Report Designer
slug: implement-database-definition-storage-efcore
position:
tags: Web Report Designer
ticketid: 1600996
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>16.2.22.1109+</td>
		</tr>
		<tr>
			<td>Project Type</td>
			<td>ASP.NET Core</td>
		</tr>
	</tbody>
</table>

## Description

Out of the box, Telerik Reporting offers the [FileDefinitionStorage](/api/telerik.webreportdesigner.services.filedefinitionstorage) class which can be used to store the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) report definitions in a local directory.

In certain cases, one may want to instead store the report definitions in a custom place, for example, a database. For this reason, we have exposed the [IDefinitionStorage](/api/Telerik.WebReportDesigner.Services.IDefinitionStorage) interface. By implementing this interface, one will be able to store the report definitions in any place, be it SQL or NoSQL database, [Azure Blob Storage](https://azure.microsoft.com/en-us/products/storage/blobs/), etc.

In this article, we will demonstrate how the report definitions can be stored in a MSSQL Server database using [Entity Framework Core](https://learn.microsoft.com/en-us/ef/core/)

## Solution

1. The first step is to create Entity Framework Core models for the Report definitions and their Folders. These models will be used later to create database tables. 

	````CSharp
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
		[Required]
		public string ParentUri { get; set; }

		[Column("Uri")]
		public string Uri { get; set; }
	}
````

	````CSharp
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
````


1. Next, we will create the custom [`DbContext`](https://learn.microsoft.com/en-us/ef/core/dbcontext-configuration/) that the will be used for querying and saving the data from inside the definition storage implementation. Additionally, we can have our `Report` and `ReportFolder` table created automatically:

	````CSharp
using CSharp.Net7.Html5IntegrationDemo.EFCore.Models;
	using Microsoft.EntityFrameworkCore;

	namespace CSharp.Net7.Html5IntegrationDemo.EFCore
	{
		public class SqlDefinitionStorageContext : DbContext
		{
			public DbSet<Report> Reports { get; set; }

			public DbSet<ReportFolder> ReportFolders { get; set; }

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
````


1. We will need to convert the data of the database model to the [Telerik.WebReportDesigner.Services.Models](/api/telerik.webreportdesigner.services.models), and for that reason, it will be handy to have an _extension_ class handling those conversions for us. For example:

	````CSharp
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
````


1. With all of the above prepared, we can now proceed with implementing the [IDefinitionStorage](/api/Telerik.WebReportDesigner.Services.IDefinitionStorage) interface:

	````CSharp
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
````


1. Lastly, the [ReportDesignerServiceConfiguration](/api/Telerik.WebReportDesigner.Services.ReportDesignerServiceConfiguration) should be set to use the `CustomDefinitionStorage` class implemented above:

	````CSharp
var builder = WebApplication.CreateBuilder(args);

	// Add services to the container.
	builder.Services.AddControllers();
	builder.Services.AddRazorPages()
					.AddNewtonsoftJson();

	builder.Services.AddDbContext<SqlDefinitionStorageContext>();
	builder.Services.AddScoped<IDefinitionStorage, CustomDefinitionStorage>();

	var reportsPath = Path.Combine(builder.Environment.ContentRootPath, "..", "..", "..", "..", "Report Designer", "Examples");

	// Configure dependencies for ReportDesignerController.
	builder.Services.TryAddScoped<IReportDesignerServiceConfiguration>(sp => new ReportDesignerServiceConfiguration
	{
		DefinitionStorage =sp.GetRequiredService<IDefinitionStorage>(),
		ResourceStorage = new ResourceStorage(Path.Combine(reportsPath, "Resources")),
		SharedDataSourceStorage = new FileSharedDataSourceStorage(Path.Combine(reportsPath, "Shared Data Sources")),
		SettingsStorage = new FileSettingsStorage(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Telerik Reporting"))
	});

	var app = builder.Build();
````


## See Also

* [Using Custom Report Definition Storage]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-implement-a-report-definition-storage%})
