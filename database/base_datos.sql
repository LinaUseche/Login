CREATE DATABASE IF NOT EXISTS `scripwebDB`
USE `scripwebDB`;

/*tabla definiciones categorias*/
DROP TABLE IF EXISTS `definicion_categoria`;
CREATE TABLE `definicion_categoria` (
    `cod_def_cate` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `nombre_def_cate` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
   `created_dc` TIMESTAMP NOT NULL,
    `updated_dc` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cpd_def_cate`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*tabla definiciones*/
DROP TABLE IF EXISTS `definiciones`;
CREATE TABLE `definiciones` (
  `cod_definicion` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `cod_def_cate` int(5) unsigned NOT NULL,
  `detalle_definicion` text COLLATE utf8_8_spanish_ci,
  `created_definition` TIMESTAMP NOT NULL,
  `updated_definition` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_def_cate`)
) ENGINE=InnoDB ACTION_INCREMENT=1 DEFAULT CHARSET=utf8 collate=utf8_spanish_ci;

/*TABLA TERMINOS*/
DROP TABLE IF EXISTS `terminos`;
CREATE TABLE `terminos`
`cod_term` int(5) unsigned NOT NULL AUTO_INCREMENT,
`nombre_term` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
`cod_definicion` int(5) unsigned NOT NULL,
`create_term`TIMESTAMP NOT NULL,
`updated_term` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_term`),
KEY `fkcoddefinicion_an` (`cod_definicion`),
CONSTRAINT `fkcoddefinicion_an` FOREIGN KEY (`cod_definicion`) REFERENCES `definicion` (`cod_definicion`) ON DELETE CASCADE ON UPDATE NO ACTION,
) ENGINE=InnoDB ACTION_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci;

/*user type*/
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
`cod_user_type` int(5) unsigned NOT NULL AUTO_INCREMENT,
`name_user_type` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
`created_user_at` TIMESTAMP NOT NULL,
`updated_user_at`TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
kEY PRIMARY (`cod_user_type`),
KEY `fkcodname_user_type_ot`(`cod_name_user`),
CONSTRAINT `fkcodname_user_type_ot` FOREIGN KEY (`cod_name_user`) REFERENCES `users` (cod_name_user) ON DELETE CASCADE NO
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_c1;

/*TABLA AREA DE APRENDIZAJE*/
DROP TABLE IF EXISTS `area_de_aprendizaje`;
CREATE TABLE `area_de_aprendizaje`
`cod_area_apren` int(5) unsigned NOT NULL AUTO_INCREMENT,
`nombre_area_apren` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
`create_area_apren`TIMESTAMP NOT NULL,
`updated_area_apren` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_area_apren`),
KEY `fkcodare_apren_usr` (`cod_area_apren`),
CONSTRAINT `fkcodarea_apren_user` FOREIGN KEY (`cod_area_apren`) REFERENCES `users` (`cod_area_apren`) ON DELETE CASCADE ON UPDATE NO ACTION,
) ENGINE=InnoDB ACTION_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci;

/*area_conocimiento*/
DROP TABLE IF EXISTS `area_conocimiento`;
CREATE TABLE `area_conocimiento`(
    `cod_cono_area` int(5) NOT NULL AUTO_INCREMENT,
    `nombre_cono_area` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_pro_cate` TIMESTAMP NOT NULL,
    `updated_pro_cate` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW()
    KEY PRIMARY (`cod_cono_area`),
    KEY `fkcodcono_area_sr` (`cod_cono_area`)
    CONSTRAINT `fkcodcono_area_sr` FOREIGN KEY (`cod_cono_area`) REFERENCES `users` (`cod_cono_area`) ON DELETE CASCADE ON UPDATE NO ACTION,
) ENGINE InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci,

/*tabla paises*/
DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `cod_pais` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `nombre_pais` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
    `postal_pais` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
    `created_country` TIMESTAMP NOT NULL,
    `update_country` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COLLATE=utf8_spanish_ci;

/*tabla estados*/
DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
    `cod_estado` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `cod_pais` int(10) unsigned NOT NULL,
    `nombre_estado` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `create_estado` TIMESTAMP NOT NULL,
    `update_estado` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_estado`)
    KEY `fkcodpais_paises_idx` (`cod_pais`),
    CONSTRAINT `fkcodpais_paises` FOREIGN KEY (`cod_pais`) REFERENCES `paises` (`cod_pais`) ON DELETE CASCADE NOT UPDATE ACTION,
) ENGINE=InnoDB ACTION_INCREMENT=1 DEFAULT CHARSET=utf8 collate=utf8_spanish_ci;

/*tabla ciudades*/
DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades` (
    `cod_ciudades` int(10) unsigned NOT NULL AUTO_INCREMENT, C
    `cod_departamento` int(10) unsigned NOT NULL,
    `nombre_ciudad` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `create_ciudad` TIMESTAMP NOT NULL,
    `update_ciudad` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_ciudades`)
    KEY `fkcodestado_estados_idx` (`cod_estados`),
    CONSTRAINT `fkcodestado_estados` FOREIGN KEY (`cod_estados`) REFERENCES `estados` (`cod_estados`) ON DELETE CASCADE NOT UPDATE ACTION,
) ENGINE=InnoDB ACTION_INCREMENT=1 DEFAULT CHARSET=utf8 collate=utf8_spanish_ci;

/*comunas*/
DROP TABLE IF EXISTS `comunas`
CREATE TABLE `comunas`(
    `cod_comuna` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `nombre_comuna` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `create_comuna` TIMESTAMP NOT NULL,
    `update_comuna` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_comuna`)
    ) ENGINE=InnoDB ACTION_INCREMENT=1 DEFAULT CHARSET=utf8 collate=utf8_spanish_ci;

/*TABLA CIUDADES_COMUNAS (TABLE PIVOT)*/
DROP TABLE IF EXISTS `ciudades_comunas`;
CREATE TABLE `ciudades_comunas` (
    `cod_ciud_comun` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `cod_ciudad` int(10) unsigned NOT NULL,
    `cod_comuna` int(10) unsigned NOT NULL,
    `created_cc` TIMESTAMP NOT NULL,
    `updated_cc` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_ciud_comun`),
KEY `fkcodcity_nps` (`cod_ciudad`) FOREIGN KEY(`cod_ciudad`),
REFERENCES `ciudades` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION,
KEY `fkcodcomuna_nps` (`cod_comuna`) FOREIGN KEY (`cod_comuna`)
REFERENCES  `comuna ` (`cod_comuna`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB ACTION_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci;

/*TABLA DE CORREGIMIENTOS*/
DROP TABLE IF EXISTS `corregimiento`;
CREATE TABLE `corregimiento` (
`cod_correg` int(10) unsigned NOT NULL AUTO_INCREMENT,
`cod_ciudad` int(10) unsigned NOT NULL,
`nombre_correg` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
`create_correg` TIMESTAMP NOT NULL,
`updated_correg` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRYMARY KEY (`cod_correg`),
KEY `fkcodciudad_use` (`cod_correg`),
CONSTRAINT `fkcodciudad_use` FOREIGN KEY (`cod_correg`) REFERENCES `users` (`cod_correg`) ON DELETE CASCADE ON UPDATE NO ACTION,
) ENGINE=InnoDB ACTION_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci;

/* TABLA DE VEREDAS*/
DROP TABLE IF EXISTS `veredas`;
CREATE TABLE `veredas` (
`cod_veredas` int(10) unsigned NOT NULL AUTO_INCREMENT,
`cod_correg` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nombre_vereda` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
`create_vereda`TIMESTAMP NOT NULL,
`updated_vereda` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_veredas`),
KEY `fkcodveredas_nn` (`cod_veredas`),
CONSTRAINT `fkcodveredas_nn` FOREIGN KEY (`cod_veredas`) REFERENCES `users` (`cod_veredas`) ON DELETE CASCADE ON UPDATE NO ACTION,
) ENGINE=InnoDB ACTION_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci;

/*TABLA BARRIO*/
DROP TABLE IF EXISTS `barrio`;
CREATE TABLE `barrio` (
`cod_barrio` int(10) unsigned NOT NULL AUTO_INCREMENT,
`cod_correg` int(10) unsigned NOT NULL,
`cod_comuna` int(30) unsigned NOT NULL,
`name_barrio` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
`create_barrio`TIMESTAMP NOT NULL,
`updated_barrio` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_barrio`),
KEY `fkcodbarrio_bar` (`cod_barrio`),
CONSTRAINT `fkcodveredas_bar` FOREIGN KEY (`cod_barrio`) REFERENCES `users` (`cod_barrio`) ON DELETE CASCADE ON UPDATE NO ACTION,
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci;

/*tipo documento*/
DROP TABLE IF EXISTS `document_type`;
CREATE TABLE `document_type` (
`cod_doc_type` int(5) unsigned NOT NULL AUTO_INCREMENT,
`name_doc_type` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
`created_doc_type_at` TIMESTAMP NOT NULL,
`updated_doc_type_at`TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
kEY PRIMARY (`cod_doc_type`),
KEY `fkcoddoc_type_ots`(`cod_doc_type`),
CONSTRAINT `fkcoddoc_type_ots` FOREIGN KEY (`cod_doc_type`) REFERENCES `user` (`cod_doc_type`) ON DELETE CASCADE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_c1;

/*imagenes*/
DROP TABLE IF EXISTS `imagenes`
CREATE TABLE `imagenes`(
    `cod_imagen` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `nombre_imagen` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `id_user` int(12) unsigned NOT NULL,
    `cod_proyecto` int(5) unsigned NOT NULL,
    `cod_idea` int(5) unsigned NOT NULL,
    `cod_cate_ima` int(5) unsigned NOT NULL,
    `created_imagen` TIMESTAMP NOT NULL,
    `updated_imagen` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_imagen`),
    KEY `fkid_user_ur` (`id_user`),
    KEY `fkcodproyecto_ur` (`cod_proyecto`),
    KEY `fkcodidea_ur` (`cod_idea`),
    KEY `fkcodcate_ima_ur` (`cod_cate_ima`)
    CONSTRAINT `fkid_user_ur` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodproyecto_ur` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodidea_ur` FOREIGN KEY (`cod_idea`) REFERENCES `idea` (`cod_idea`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `fkcodcate_ima_ur` FOREIGN KEY (`cod_cate_ima`) REFERENCES `categoria_imagenes` (`cod_cate_ima`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci,

/*categoria imagenes*/
DROP TABLE IF EXISTS `categoria_imagenes`
CREATE TABLE `categoria_imagenes`(
    `cod_cate_ima` int(2) unsigned NOT NULL AUTO_INCREMENT,
    `nombre_cate_ima` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
    `created_cate_ima` TIMESTAMP NOT NULL,
    `updated_cate_ima` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_cate_ima`)
) ENGINE InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci;

/*proyectos*/
DROP TABLE IF EXISTS `proyectos`;
CREATE TABLE `proyectos` (
  `cod_proyecto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_proyecto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*clases*/
DROP TABLE IF EXISTS `clases`;
CREATE TABLE `clases` (
  `cod_clase` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_clase` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cod_cat_clase` int(10) unsigned NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_clase`),
  KEY `fkcodcatclase_categoriaclases_idx` (`cod_cat_clase`),
  CONSTRAINT `fkcodcatclase_categoriaclases` FOREIGN KEY (`cod_cat_clase`) REFERENCES `categoria_clases` (`cod_cat_clase`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*proyecto_clases*/
DROP TABLE IF EXISTS `proyectos_clases`;
CREATE TABLE `proyectos_clases` (
  `cod_proy_clases` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cod_proyecto` int(10) NOT NULL,
  `cod_clase` int(10) NOT NULL,
  PRIMARY KEY (`cod_proy_clases`),
  KEY `fkcodproyecto_proyectos_idx` (`cod_proyecto`),
  KEY `fkcodclase_clases_idx` (`cod_clase`),
  CONSTRAINT `fkcodproyecto_proyectos` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyectos` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*categoria_clases*/
DROP TABLE IF EXISTS `categoria_clases`;
CREATE TABLE `categoria_clases` (
  `cod_cat_clase` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_cat_clase` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_cat_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*subdominios*/
DROP TABLE IF EXISTS `subdominios`
CREATE TABLE `subdomminios`(
    `cod_subdomminio` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `url_subdomminio` text COLLATE utf8_8_spanish_ci,
    `cod_proyecto` int(5) unsigned NOT NULL,
    `create_comuna` TIMESTAMP NOT NULL,
    `update_comuna` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_subdominio`)
    KEY `fkcodproyecto_proyectos_idx` (`cod_proyectos`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 collate=utf8_spanish_ci;

/*TABLA DESCRIPCION DE PROYECTO*/
DROP TABLE IF EXISTS `descripcion_de_proyecto`;
CREATE TABLE `descripcion_de_proyecto`
`cod_desc_proy` int(5) unsigned NOT NULL AUTO_INCREMENT,
`cod_proyecto` int(5) unsigned NOT NULL,
`text_desc_proy` text COLLATE utf8_spanish_ci NOT NULL,
`create_desc_proy`TIMESTAMP NOT NULL,
`updated_des_proy` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`cod_des_proy`),
KEY `fkcodproyecto_mt` (`cod_proyecto`),
CONSTRAINT `fkcodproyecto_mt` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyectos` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci;

/*estado proyecto*/
DROP TABLE IF EXISTS `estado_proyecto`
CREATE TABLE `estado_proyecto`(
    `cod_pro_est`int(5) unsigned NOT NULL AUTO_INCREMENT,
    `nombre_pro_est` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
    `created_pro_est` TIMESTAMP NOT NULL,
    `updated_pro_est` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_pro_est`)
    KEY `fkcod_proy_est_pr` (`cod_pro_est`)
    CONSTRAINT `fkcod_proy_est_pr` FOREIGN KEY (`cod_pro_est`) REFERENCES `` (`cod_pro_est`) ON DELETE CASCADE ON UPDATE NO ACTION,
) ENGINE InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET utf8_spanish_ci,

/*fases proyecto*/
DROP TABLE IF EXISTS `fases_proyecto`
CREATE TABLE `fases_proyecto` (
    `cod_fa_pro` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `nombre_fa_pro` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `duracion_fa_pro` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `created_fa_pro` TIMESTAMP NOT NULL,
    `updated_fa_pro` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (`cod_fa_pro`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET utf8 COLLATE=utf8_spanish_ci,

/*proyecto categorias*/
DROP TABLE IF EXISTS `proyecto_categoria`
CREATE TABLE `proyecto_categoria`(
    `cod_pro_cate` int(5) NOT NULL AUTO_INCREMENT,
    `nombre_pro_cate` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
    `created_pro_cate` TIMESTAMP NOT NULL,
    `updated_pro_cate` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW()
    KEY PRIMARY (`cod_pro_cate`),
     KEY `fkcodpro_cate_usr` (`cod_pro_cate`)
    CONSTRAINT `fkcodpro_cate_usr` FOREIGN KEY (`cod_pro_cate`) REFERENCES `proyecto` (`cod_pro_cate`) ON DELETE CASCADE ON UPDATE NO ACTION,
) ENGINE InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci,

/*ideas*/
DROP TABLE IF EXISTS `ideas`;
CREATE TABLE `ideas` (
`cod_idea` int(5) unsigned NOT NULL AUTO_INCREMENT,
`cod_pro_cate` int(5) unsigned NOT NULL,
`id_user` int(12) unsigned NOT NULL,
`title_idea` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
`detail_idea` text COLLATE utf8_spanish_ci NOT NULL,
`created_user_at` TIMESTAMP NOT NULL,
`updated_user_at`TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
kEY PRIMARY (`cod_idea`),
KEY `fkid_user_ot`(`id_user`),
CONSTRAINT `fkid_user_ot` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE NO
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_c1;

/*users*/
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`id_user` int(12) unsigned NOT NULL AUTO_INCREMENT,
`cod_user_type` int(5) unsigned NOT NULL,
`level_user` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
`cod_train_area`int(5) unsigned NULL,
`cod_know_area`int(5) unsigned NULL,
`name_user` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
`genre_user`varchar (10) COLLATE utf8_spanish_ci NOT NULL,
`year_user` int(4) unsigned NOT NULL,
`month_user` int(2) unsigned NOT NULL,
`day_user` int(2) unsigned NOT NULL,
`document_user` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
`cod_doc_type` int(5) unsigned NOT NULL,
`email_user` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
`pass_user` varhar(128) COLLATE utf8_spanish_ci NOT NULL,
`salt_user` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
`confirm_user` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
`cellphone_user` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
`phone_user` varchar(10) COLLATE utf8_spanish_ci NULL,
`cod_country` int(10) unsigned NOT NULL,
`cod_state` int(10) unsigned NOT NULL,
`cod_city` int(10) unsigned NOT NULL,
`cod_comunne` int(10) unsigned NOT NULL,
`cod_neighb` int(10) unsigned NULL,
`cod_town` int(10) unsigned NULL,
`cod_village` int(10) unsigned NULL,
`address_user` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
`created_user_at` TIMESTAMP NOT NULL,
`updated_user_at` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_c1;

/*foros*/
DROP TABLE IF EXISTS `forums`;
CREATE TABLE `forums` (
`cod_forum` int(5) unsigned NOT NULL AUTO_INCREMENT,
`name_forum` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
`cod_pro_cate` int(5) unsigned NOT NULL,
`cod_project` int(5) unsigned NOT NULL,
`id_user` int(12) unsigned NOT NULL,
`created_forum_at` TIMESTAMP NOT NULL,
`updated_forum_at`TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
kEY PRIMARY (`cod_idea`),
KEY `fkid_user_other`(`id_user`),
CONSTRAINT `fkid_user_other` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_c1;

/*tabla pivot proyectos_susuarios*/
DROP TABLE IF EXISTS `proyectos_users`
CREATE TABLE `proyectos_users` (
    `cod_proyectos_users` int(5) unsigned NOT NULL AUTO_INCREMENT,
    `cod_proyecto` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
    `id_user` int(12) unsigned NOT NULL,
    `create_pro_user` TIMESTAMP NOT NULL,
    `update_pro_user` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY (cod_proyectps_users)
    KEY `fkcodproyecto_proyectos_idx` (`cod_proyectos`),
    CONSTRAINT `fkproyectos_proyectos` FOREIGN KEY (`cod_proyectos`) REFERENCES `proyectos` (`cod_proyectos`) ON DELETE CASCADE NOT UPDATE ACTION,
    KEY `fkidusers_users_idx` (`id_users`),
    CONSTRAINT `fkidusers_users_` FOREIGN KEY (`id_users`) REFERENCES `estados` (`id_users`) ON DELETE CASCADE NOT UPDATE ACTION,
)   ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 collate=utf8_spanish_ci;

/*preguntas_foro*/
DROP TABLE IF EXISTS `preguntas_foro`
CREATE TABLE `preguntas_foro`(
    `cod_for_pre` int(5) NOT NULL AUTO_INCREMENT,
    `pre_for_pre` text COLLATE utf8_spanish_ci NOT NULL,
    `cod_foro` int(5) NOT NULL,
    `id_user` int(12) NOT NULL,
    `created_for_pre` TIMESTAMP NOT NULL,
    `updated_for_pre` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW()
    KEY PRIMARY (`cod_for_pre`),
    KEY `fkcod_foro_for` (`cod_foro`)
    CONSTRAINT `fkcod_foro_for` FOREIGN KEY (`cod_foro`) REFERENCES `foro` (`cod_foro`) ON DELETE CASCADE ON UPDATE NO ACTION,
    KEY `fkid_user_usru` (`id_user`)
    CONSTRAINT `fkid_user_usru` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION,
) ENGINE InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8_spanish_ci,



/*paises*/
INSERT INTO `pais` (`cod_pais`, `nombre_pais`, `postal_pais`, `created_country`, `update_country`)
VALUES (1, 'Colombia', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (2, 'Venezuela', '58', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (3, 'Guyana', '92', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (4, 'Surinam', '597', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (5, 'Guayana francesa', '594', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (6, 'Ecuador', '593', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (7, 'Perú', '51', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (8, 'Brasil', '55', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (9, 'Bolivia', '591', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (10, 'Paraguay', '595', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (11, 'Uruguay', '598', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (12, 'Chile', '56', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (13, 'Argentina', '54', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

/*departamentos*/
INSERT INTO `` (`cod_pais`, `nombre_pais`, `postal_pais`, `created_country`, `update_country`)
VALUES (1, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (2, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (3, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (4, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (5, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (6, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (7, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (8, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (9, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (10, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (11, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (12, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
VALUES (13, '', '57', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
