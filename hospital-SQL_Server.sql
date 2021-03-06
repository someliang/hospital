use master
go
if exists(select * from sysdatabases where name='hospital')
	drop database hospital
go
create database hospital
go
USE hospital
GO
/****** Object:  Table [dbo].[person]    Script Date: 05/03/2016 20:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[person](
	[id] [int] NOT NULL,
	[idCardNo] [varchar](20) NULL,
	[organization] [varchar](36) NULL,
	[name] [varchar](20) NULL,
	[gender] [varchar](20) NULL,
	[age] [varchar](20) NULL,
	[tel] [varchar](20) NULL,
	[marryStatus] [varchar](20) NULL,
	[examID] [varchar](36) NULL,
	[examImage] [varchar](36) NULL,
	[applyID] [varchar](36) NULL,
	[applyImage] [varchar](36) NOT NULL,
	[cost] [decimal](10, 0) NULL,
	[allCost] [decimal](10, 0) NULL,
	[address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[examination]    Script Date: 05/03/2016 20:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[examination](
	[id] [int] NOT NULL,
	[idCardNo] [varchar](255) NULL,
	[examDepartment] [varchar](30) NULL,
	[examAddress] [varchar](255) NULL,
	[examItem] [varchar](30) NULL,
	[admin] [varchar](30) NULL,
	[applyDepartment] [varchar](255) NULL,
	[applyItem] [varchar](255) NULL,
	[applyTime] [datetime] NULL,
	[signDoctor] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[application]    Script Date: 05/03/2016 20:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[application](
	[id] [int] NOT NULL,
	[idCardNo] [varchar](20) NULL,
	[applyItem] [varchar](20) NULL,
	[signDoctor] [varchar](20) NULL,
	[applyDepartment] [varchar](20) NULL,
	[applyTime] [varchar](20) NULL,
	[examAddress] [varchar](56) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[view_person]    Script Date: 05/03/2016 20:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_person] as
select * from person
GO
/****** Object:  View [dbo].[view_examination]    Script Date: 05/03/2016 20:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_examination] as
select * from examination
GO
/****** Object:  View [dbo].[view_application]    Script Date: 05/03/2016 20:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_application] as
select * from application
GO
/****** Object:  Default [DF__applicati__idCar__0EA330E9]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[application] ADD  DEFAULT (NULL) FOR [idCardNo]
GO
/****** Object:  Default [DF__applicati__apply__0F975522]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[application] ADD  DEFAULT (NULL) FOR [applyItem]
GO
/****** Object:  Default [DF__applicati__signD__108B795B]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[application] ADD  DEFAULT (NULL) FOR [signDoctor]
GO
/****** Object:  Default [DF__applicati__apply__117F9D94]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[application] ADD  DEFAULT (NULL) FOR [applyDepartment]
GO
/****** Object:  Default [DF__applicati__apply__1273C1CD]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[application] ADD  DEFAULT (NULL) FOR [applyTime]
GO
/****** Object:  Default [DF__applicati__examA__1367E606]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[application] ADD  DEFAULT (NULL) FOR [examAddress]
GO
/****** Object:  Default [DF__examinati__idCar__182C9B23]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[examination] ADD  DEFAULT (NULL) FOR [idCardNo]
GO
/****** Object:  Default [DF__examinati__examD__1920BF5C]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[examination] ADD  DEFAULT (NULL) FOR [examDepartment]
GO
/****** Object:  Default [DF__examinati__examA__1A14E395]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[examination] ADD  DEFAULT (NULL) FOR [examAddress]
GO
/****** Object:  Default [DF__examinati__examI__1B0907CE]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[examination] ADD  DEFAULT (NULL) FOR [examItem]
GO
/****** Object:  Default [DF__examinati__admin__1BFD2C07]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[examination] ADD  DEFAULT (NULL) FOR [admin]
GO
/****** Object:  Default [DF__examinati__apply__1CF15040]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[examination] ADD  DEFAULT (NULL) FOR [applyDepartment]
GO
/****** Object:  Default [DF__examinati__apply__1DE57479]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[examination] ADD  DEFAULT (NULL) FOR [applyItem]
GO
/****** Object:  Default [DF__examinati__apply__1ED998B2]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[examination] ADD  DEFAULT (NULL) FOR [applyTime]
GO
/****** Object:  Default [DF__examinati__signD__1FCDBCEB]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[examination] ADD  DEFAULT (NULL) FOR [signDoctor]
GO
/****** Object:  Default [DF__person__idCardNo__24927208]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [idCardNo]
GO
/****** Object:  Default [DF__person__organisa__25869641]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [organization]
GO
/****** Object:  Default [DF__person__name__267ABA7A]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [name]
GO
/****** Object:  Default [DF__person__gender__276EDEB3]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [gender]
GO
/****** Object:  Default [DF__person__age__286302EC]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [age]
GO
/****** Object:  Default [DF__person__tel__29572725]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [tel]
GO
/****** Object:  Default [DF__person__marrySta__2A4B4B5E]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [marryStatus]
GO
/****** Object:  Default [DF__person__examID__2B3F6F97]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [examID]
GO
/****** Object:  Default [DF__person__examImag__2C3393D0]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [examImage]
GO
/****** Object:  Default [DF__person__applyID__2D27B809]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [applyID]
GO
/****** Object:  Default [DF__person__cost__2E1BDC42]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [cost]
GO
/****** Object:  Default [DF__person__allCost__2F10007B]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [allCost]
GO
/****** Object:  Default [DF__person__address__300424B4]    Script Date: 05/03/2016 20:03:01 ******/
ALTER TABLE [dbo].[person] ADD  DEFAULT (NULL) FOR [address]
GO


INSERT INTO application VALUES ('1', '51018419880821006X', '胸部正位', '吴静', '体检部', '2016-01-05 08:51:00', 'C区1楼放射科');

INSERT INTO examination VALUES ('1', '51018419880821006X', '体检部-外科检查', 'A区一楼门诊部外科2诊室', '外科检查', '陈长', null, null, null, null);
INSERT INTO examination VALUES ('2', '51018419880821006X', '体检部-内科检查', 'A区一楼门诊部外科1诊室', '内科检查', '', null, null, null, null);
INSERT INTO examination VALUES ('3', '51018419880821006X', '体检部-眼耳鼻喉检查室', 'A区一楼门诊部', '眼科检查', null, null, null, null, null);
INSERT INTO examination VALUES ('4', '51018419880821006X', '体检部-口腔检查检查室', 'A区一楼门诊部', '口腔检查', null, null, null, null, null);
INSERT INTO examination VALUES ('5', '51018419880821006X', '妇科检查', 'C区1楼体检部', '妇检', null, null, null, null, null);

INSERT INTO person VALUES ('1', '51018419880821006X', '四川化工职业技术学院', '陈张', '男', '34', '15228461257', '已婚', '1600234012','1600234012', '1600234012', '', '199', '3000', null);
INSERT INTO person VALUES ('2', 'Ling', 'Liang', null, null, null, null, null, null, null, null, '', null, null, null);

CREATE PROC person_report @idCardNo varchar(20)
as select * from view_person where idCardNo=@idCardNo
GO