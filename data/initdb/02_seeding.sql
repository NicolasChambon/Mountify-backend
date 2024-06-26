BEGIN;

INSERT INTO 
  "species" ("id", "name", "type", "description") -- 0: Fauna, 1: Flora
VALUES
  (1, 'Aigle royal', 0, 'L''aigle royal est un rapace diurne de grande taille, réputé pour sa force et sa rapidité en vol. Il est l''un des plus grands rapaces d''Europe.'),
  (2, 'Bouquetin', 0, 'Le bouquetin des Alpes est une espèce de mammifères de la famille des Bovidés. Il est l''un des symboles de la faune alpine.'),
  (3, 'Chamois', 0, 'Le chamois est un mammifère de la famille des Bovidés. Il est un symbole de la faune alpine.'),
  (4, 'Edelweiss', 1, 'L''edelweiss est une plante vivace de la famille des Astéracées. Elle est l''une des fleurs emblématiques des Alpes.'),
  (5, 'Marmotte', 0, 'La marmotte est un mammifère de la famille des Sciuridés. Elle est un symbole de la faune alpine.'),
  (6, 'Renard roux', 0, 'Le renard roux est un mammifère de la famille des Canidés. Il est l''un des plus grands carnivores d''Europe.'),
  (7, 'Tétras-lyre', 0, 'Le tétras-lyre est un oiseau de la famille des Phasianidés. Il est l''un des symboles de la faune alpine.'),
  (8, 'Chouette effraie', 0, 'La chouette effraie est un rapace nocturne de taille moyenne, reconnaissable à son plumage blanc et son vol silencieux.'),
  (9, 'Lynx boréal', 0, 'Le lynx boréal est un félin de taille moyenne, caractérisé par ses oreilles touffues et ses pattes postérieures plus longues que les antérieures.'),
  (10, 'Loup gris', 0, 'Le loup gris est un grand carnivore de la famille des Canidés, connu pour sa meute sociale et sa capacité de chasse en groupe.'),
  (11, 'Bouleau', 1, 'Le bouleau est un arbre à écorce blanche, répandu dans les régions tempérées. Il est apprécié pour son bois et ses propriétés médicinales.'),
  (12, 'Chêne', 1, 'Le chêne est un arbre majestueux, symbole de force et de longévité. Il est utilisé dans la construction et la fabrication de meubles.'),
  (13, 'Pin sylvestre', 1, 'Le pin sylvestre est un conifère répandu dans les forêts tempérées. Son bois est utilisé dans la construction et la fabrication de papier.'),
  (14, 'Gentiane jaune', 1, 'La gentiane jaune est une plante vivace aux fleurs jaunes vives, présente dans les prairies alpines. Elle est utilisée en herboristerie.'),
  (15, 'Lys martagon', 1, 'Le lys martagon est une plante vivace aux fleurs en forme de clochettes, présente dans les sous-bois des régions montagneuses.'),
  (16, 'Chardon bleu', 1, 'Le chardon bleu est une plante vivace aux fleurs bleues, caractéristique des prairies alpines. Il est apprécié pour son aspect décoratif.'),
  (17, 'Bison d''Europe', 0, 'Le bison d''Europe est un mammifère herbivore de grande taille, autrefois présent en grand nombre sur le continent. Il est aujourd''hui protégé.'),
  (18, 'Loutre d''Europe', 0, 'La loutre d''Europe est un mammifère semi-aquatique, reconnaissable à sa fourrure épaisse et sa queue aplatie. Elle est présente dans les cours d''eau.'),
  (19, 'Aigle botté', 0, 'L''aigle botté est un rapace diurne de taille moyenne, reconnaissable à ses plumes en forme de bottes sur les pattes. Il est présent dans les régions boisées.'),
  (20, 'Orchidée sauvage', 1, 'L''orchidée sauvage est une plante vivace aux fleurs colorées et complexes, présente dans les milieux naturels. Elle est appréciée pour son aspect esthétique.');  

INSERT INTO 
  "country" ("id", "name")
VALUES 
  (1, 'Afghanistan'),
  (2, 'Afrique du sud'),
  (3, 'Albanie'),
  (4, 'Algérie'),
  (5, 'Allemagne'),
  (6, 'Andorre'),
  (7, 'Angola'),
  (8, 'Antigua-et-Barbuda'),
  (9, 'Arabie saoudite'),
  (10, 'Argentine'),
  (11, 'Arménie'),
  (12, 'Australie'),
  (13, 'Autriche'),
  (14, 'Azerbaïdjan'),
  (15, 'Bahamas'),
  (16, 'Bahreïn'),
  (17, 'Bangladesh'),
  (18, 'Barbade'),
  (19, 'Belgique'),
  (20, 'Belize'),
  (21, 'Bénin'),
  (22, 'Bhoutan'),
  (23, 'Biélorussie'),
  (24, 'Birmanie'),
  (25, 'Bolivie'),
  (26, 'Bosnie-Herzégovine'),
  (27, 'Botswana'),
  (28, 'Brésil'),
  (29, 'Brunei'),
  (30, 'Bulgarie'),
  (31, 'Burkina Faso'),
  (32, 'Burundi'),
  (33, 'Cambodge'),
  (34, 'Cameroun'),
  (35, 'Canada'),
  (36, 'Cap-Vert'),
  (37, 'République centrafricaine'),
  (38, 'Chili'),
  (39, 'Chine'),
  (40, 'Chypre'),
  (41, 'Colombie'),
  (42, 'Comores'),
  (43, 'République du Congo'),
  (44, 'République démocratique du Congo'),
  (45, 'Corée du Nord'),
  (46, 'Corée du Sud'),
  (47, 'Costa Rica'),
  (48, 'Côte d''Ivoire'),
  (49, 'Croatie'),
  (50, 'Cuba'),
  (51, 'Danemark'),
  (52, 'Djibouti'),
  (53, 'Dominique'),
  (54, 'Égypte'),
  (55, 'Émirats arabes unis'),
  (56, 'Équateur'),
  (57, 'Érythrée'),
  (58, 'Espagne'),
  (59, 'Estonie'),
  (60, 'États-Unis'),
  (61, 'Éthiopie'),
  (62, 'Fidji'),
  (63, 'Finlande'),
  (64, 'France'),
  (65, 'Gabon'),
  (66, 'Gambie'),
  (67, 'Géorgie'),
  (68, 'Ghana'),
  (69, 'Grèce'),
  (70, 'Grenade'),
  (71, 'Guatemala'),
  (72, 'Guinée'),
  (73, 'Guinée-Bissau'),
  (74, 'Guinée équatoriale'),
  (75, 'Guyana'),
  (76, 'Haïti'),
  (77, 'Honduras'),
  (78, 'Hongrie'),
  (79, 'Inde'),
  (80, 'Indonésie'),
  (81, 'Irak'),
  (82, 'Iran'),
  (83, 'Irlande'),
  (84, 'Islande'),
  (85, 'Israël'),
  (86, 'Italie'),
  (87, 'Jamaïque'),
  (88, 'Japon'),
  (89, 'Jordanie'),
  (90, 'Kazakhstan'),
  (91, 'Kenya'),
  (92, 'Kirghizistan'),
  (93, 'Kiribati'),
  (94, 'Koweït'),
  (95, 'Laos'),
  (96, 'Lesotho'),
  (97, 'Lettonie'),
  (98, 'Liban'),
  (99, 'Liberia'),
  (100, 'Libye'),
  (101, 'Liechtenstein'),
  (102, 'Lituanie'),
  (103, 'Luxembourg'),
  (104, 'Macédoine'),
  (105, 'Madagascar'),
  (106, 'Malaisie'),
  (107, 'Malawi'),
  (108, 'Maldives'),
  (109, 'Mali'),
  (110, 'Malte'),
  (111, 'Maroc'),
  (112, 'Marshall'),
  (113, 'Maurice'),
  (114, 'Mauritanie'),
  (115, 'Mexique'),
  (116, 'Micronésie'),
  (117, 'Moldavie'),
  (118, 'Monaco'),
  (119, 'Mongolie'),
  (120, 'Monténégro'),
  (121, 'Mozambique'),
  (122, 'Namibie'),
  (123, 'Nauru'),
  (124, 'Népal'),
  (125, 'Nicaragua'),
  (126, 'Niger'),
  (127, 'Nigeria'),
  (128, 'Niue'),
  (129, 'Norvège'),
  (130, 'Nouvelle-Zélande'),
  (131, 'Oman'),
  (132, 'Ouganda'),
  (133, 'Ouzbékistan'),
  (134, 'Pakistan'),
  (135, 'Palaos'),
  (136, 'Palestine'),
  (137, 'Panama'),
  (138, 'Papouasie-Nouvelle-Guinée'),
  (139, 'Paraguay'),
  (140, 'Pays-Bas'),
  (141, 'Pérou'),
  (142, 'Philippines'),
  (143, 'Pologne'),
  (144, 'Portugal'),
  (145, 'Qatar'),
  (146, 'Roumanie'),
  (147, 'Royaume-Uni'),
  (148, 'Russie'),
  (149, 'Rwanda'),
  (150, 'Saint-Christophe-et-Niévès'),
  (151, 'Sainte-Lucie'),
  (152, 'Saint-Marin'),
  (153, 'Saint-Vincent-et-les-Grenadines'),
  (154, 'Salomon'),
  (155, 'Salvador'),
  (156, 'Samoa'),
  (157, 'São Tomé-et-Príncipe'),
  (158, 'Sénégal'),
  (159, 'Serbie'),
  (160, 'Seychelles'),
  (161, 'Sierra Leone'),
  (162, 'Singapour'),
  (163, 'Slovaquie'),
  (164, 'Slovénie'),
  (165, 'Somalie'),
  (166, 'Soudan'),
  (167, 'Soudan du Sud'),
  (168, 'Sri Lanka'),
  (169, 'Suède'),
  (170, 'Suisse'),
  (171, 'Suriname'),
  (172, 'Swaziland'),
  (173, 'Syrie'),
  (174, 'Tadjikistan'),
  (175, 'Tanzanie'),
  (176, 'Tchad'),
  (177, 'République tchèque'),
  (178, 'Thaïlande'),
  (179, 'Timor oriental'),
  (180, 'Togo'),
  (181, 'Tonga'),
  (182, 'Trinité-et-Tobago'),
  (183, 'Tunisie'),
  (184, 'Turkménistan'),
  (185, 'Turquie'),
  (186, 'Tuvalu'),
  (187, 'Ukraine'),
  (188, 'Uruguay'),
  (189, 'Vanuatu'),
  (190, 'Vatican'),
  (191, 'Venezuela'),
  (192, 'Viêt Nam'),
  (193, 'Yémen'),
  (194, 'Zambie'),
  (195, 'Zimbabwe');

INSERT INTO
  "region" ("id", "name") -- mountain regions in the world
VALUES
  (1, 'Alpes'),
  (2, 'Andes'),
  (3, 'Appalaches'),
  (4, 'Atlas'),
  (5, 'Carpates'),
  (6, 'Caucase'),
  (7, 'Himalaya'),
  (8, 'Rocheuses'),
  (9, 'Corse'),
  (10, 'Jura'),
  (11, 'Massif central'),
  (12, 'Pyrénées'),
  (13, 'Vosges'),
  (14, 'Sierra Nevada'),
  (15, 'Picos de Europa'),
  (16, 'Apennins'),
  (17, 'Tian Shan'),
  (18, 'Karakoram'),
  (19, 'Hindu Kush'),
  (20, 'Pamir'),
  (21, 'Drakensberg'),
  (22, 'Rif'),
  (23, 'Simien'),
  (24, 'Kilimandjaro'),
  (25, 'Serra do Mar'),
  (26, 'La Réunion'),
  (27, 'Les Ardennes'),
  (28, 'Alpes australiennes'),
  (29, 'Tasmanie'),
  (30, 'Alpes du Sud'),
  (31, 'Alpes du Nord'),
  (32, 'Alpes japonaises'),
  (33, 'Monts Ellsworth');

INSERT INTO
  "user" ("id", "username", "email", "password_hash", "picture")
VALUES
  (1, 'Farid', 'farid.belec@mailbox.com', 'password', 'https://randomuser.me/api/portraits/men/1.jpg'),
  (2, 'Alice', 'foufou24@youpy.fr', 'password', 'https://randomuser.me/api/portraits/women/1.jpg'),
  (3, 'Bob', 'mercerBob@lycos.net', 'password', 'https://randomuser.me/api/portraits/men/2.jpg'),
  (4, 'Jade', 'jade.french@example.com', 'password', 'https://randomuser.me/api/portraits/women/2.jpg'),
  (5, 'Huus', 'aleksander.huus@example.com', 'password', 'https://randomuser.me/api/portraits/men/3.jpg');  

INSERT INTO
  "mountain" ("id", "name", "latitude", "longitude", "altitude", "description", "picture", "user_id", "country_id", "region_id")
VALUES
  (1, 'Mont Blanc', 45.8325, 6.8644, 4808, 'Le mont Blanc est le plus haut sommet des Alpes et d''Europe occidentale. Il est situé entre la France et l''Italie.', 'https://upload.wikimedia.org/wikipedia/commons/9/9d/Mont_Blanc_depuis_Valmorel.jpg', 1, 64, 1),
  (2, 'Cervin', 45.9764, 7.6586, 4478, 'Le Cervin est un sommet emblématique des Alpes, situé à la frontière entre la Suisse et l''Italie.', 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Matterhorn_from_Domh%C3%BCtte_-_2.jpg', 2, 64, 1),
  (3, 'Mont Rose', 45.9342, 7.8686, 4634, 'Le mont Rose est le deuxième plus haut sommet des Alpes, situé entre la Suisse et l''Italie.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Monte_Rosa.jpg', 3, 64, 1),
  (4, 'Monte Viso', 44.6611, 7.0708, 3841, 'Le mont Viso est le point culminant des Alpes cottiennes, situé en Italie.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Monte_Viso.jpg', 4, 64, 1),
  (5, 'Grand Paradis', 45.5167, 7.2667, 4061, 'Le Grand Paradis est le plus haut sommet du massif du Grand Paradis, situé en Italie.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Gran_Paradiso.jpg', 5, 64, 1),
  (6, 'Barre des Écrins', 44.9242, 6.3575, 4102, 'La Barre des Écrins est le point culminant du massif des Écrins, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Barre_des_%C3%89crins.jpg', 1, 64, 1),
  (7, 'Aiguille Verte', 45.9231, 6.8819, 4122, 'L''Aiguille Verte est un sommet emblématique du massif du Mont Blanc, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Aiguille_Verte.jpg', 2, 64, 1),
  (8, 'Dôme des Écrins', 44.9208, 6.3575, 4015, 'Le Dôme des Écrins est le deuxième plus haut sommet du massif des Écrins, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/D%C3%B4me_des_%C3%89crins.jpg', 3, 64, 1),
  (9, 'Mont Pelvoux', 44.9225, 6.3661, 3943, 'Le mont Pelvoux est le point culminant du massif des Écrins, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mont_Pelvoux.jpg', 4, 64, 1),
  (10, 'Mont Thabor', 45.0592, 6.6661, 3178, 'Le mont Thabor est un sommet du massif des Cerces, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mont_Thabor.jpg', 5, 64, 1),
  (11, 'Monte Perdido', 42.6642, 0.0175, 3355, 'Le mont Perdu est un sommet des Pyrénées, situé entre la France et l''Espagne.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Monte_Perdido.jpg', 1, 64, 12),
  (12, 'Aneto', 42.6311, 0.6544, 3404, 'L''Aneto est le point culminant des Pyrénées, situé en Espagne.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Aneto.jpg', 2, 64, 12),
  (13, 'Vignemale', 42.7811, 0.1344, 3298, 'Le Vignemale est un sommet des Pyrénées, situé entre la France et l''Espagne.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Vignemale.jpg', 3, 64, 12),
  (14, 'Pic du Midi d''Ossau', 42.7975, 0.4261, 2884, 'Le pic du Midi d''Ossau est un sommet des Pyrénées, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Pic_du_Midi_d%27Ossau.jpg', 4, 64, 12),
  (15, 'Pic d''Anie', 42.9661, 0.9175, 2504, 'Le pic d''Anie est un sommet des Pyrénées, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Pic_d%27Anie.jpg', 5, 64, 12),
  (16, 'Pic de Bugarach', 42.8758, 2.3758, 1230, 'Le pic de Bugarach est un sommet des Corbières, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Pic_de_Bugarach.jpg', 1, 64, 12),
  (17, 'Mont Canigou', 42.5292, 2.4561, 2784, 'Le mont Canigou est un sommet des Pyrénées, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mont_Canigou.jpg', 2, 64, 12),
  (18, 'Mont Aiguille', 44.8331, 5.4164, 2086, 'Le mont Aiguille est un sommet du Vercors, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mont_Aiguille.jpg', 3, 64, 13),
  (19, 'Grand Veymont', 44.8831, 5.4164, 2341, 'Le Grand Veymont est le point culminant du Vercors, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Grand_Veymont.jpg', 4, 64, 13),
  (20, 'Mont Ventoux', 44.1731, 5.2764, 1912, 'Le mont Ventoux est un sommet des Préalpes, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mont_Ventoux.jpg', 5, 64, 13),
  (21, 'Mont Mézenc', 44.9261, 4.2164, 1753, 'Le mont Mézenc est un sommet des Cévennes, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mont_M%C3%A9zenc.jpg', 1, 64, 13),
  (22, 'Mont Lozère', 44.5292, 3.7561, 1699, 'Le mont Lozère est un sommet des Cévennes, situé en France.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mont_Loz%C3%A8re.jpg', 2, 64, 13),
  -- en Amérique du nord
  (23, 'Mont McKinley', 63.0694, -151.0075, 6190, 'Le mont McKinley est le plus haut sommet d''Amérique du Nord, situé en Alaska.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_McKinley.jpg', 3, 35, 3),
  (24, 'Mont Logan', 60.5675, -140.4058, 5959, 'Le mont Logan est le deuxième plus haut sommet d''Amérique du Nord, situé au Canada.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Logan.jpg', 4, 35, 3),
  (25, 'Mont Saint Elias', 60.2908, -140.9181, 5489, 'Le mont Saint Elias est un sommet d''Amérique du Nord, situé à la frontière entre le Canada et les États-Unis.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Saint_Elias.jpg', 5, 35, 3),
  (26, 'Mont Foraker', 62.9608, -151.3992, 5304, 'Le mont Foraker est un sommet d''Amérique du Nord, situé en Alaska.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Foraker.jpg', 1, 35, 3),
  (27, 'Mont Bona', 61.3858, -141.7481, 5074, 'Le mont Bona est un sommet d''Amérique du Nord, situé en Alaska.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Bona.jpg', 2, 35, 3),
  (28, 'Mont Blackburn', 61.7308, -143.4058, 4996, 'Le mont Blackburn est un sommet d''Amérique du Nord, situé en Alaska.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Blackburn.jpg', 3, 35, 3),
  -- en Amérique du sud
  (29, 'Mont Aconcagua', -32.6531, -70.0114, 6962, 'Le mont Aconcagua est le plus haut sommet d''Amérique du Sud, situé en Argentine.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Aconcagua.jpg', 4, 10, 2),
  (30, 'Mont Ojos del Salado', -27.1092, -68.5425, 6893, 'Le mont Ojos del Salado est le deuxième plus haut sommet d''Amérique du Sud, situé à la frontière entre le Chili et l''Argentine.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Ojos_del_Salado.jpg', 5, 10, 2),
  (31, 'Mont Pissis', -27.7664, -68.5558, 6793, 'Le mont Pissis est un sommet d''Amérique du Sud, situé en Argentine.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Pissis.jpg', 1, 10, 2),
  (32, 'Mont Mercedario', -31.9925, -70.1414, 6770, 'Le mont Mercedario est un sommet d''Amérique du Sud, situé en Argentine.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mercedario.jpg', 2, 10, 2),
  (33, 'Mont Bonete', -27.1092, -68.5425, 6759, 'Le mont Bonete est un sommet d''Amérique du Sud, situé à la frontière entre le Chili et l''Argentine.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Bonete.jpg', 3, 10, 2),
  -- en Océanie
  (34, 'Mont Cook', -43.5958, 170.1414, 3724, 'Le mont Cook est le plus haut sommet de Nouvelle-Zélande, situé sur l''île du Sud.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Cook.jpg', 4, 130, 29),
  (35, 'Mont Tasman', -43.5958, 170.1414, 3497, 'Le mont Tasman est un sommet de Nouvelle-Zélande, situé sur l''île du Sud.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Tasman.jpg', 5, 130, 29),
  (36, 'Mont Dampier', -43.5958, 170.1414, 3440, 'Le mont Dampier est un sommet de Nouvelle-Zélande, situé sur l''île du Sud.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Dampier.jpg', 1, 130, 29),
  (37, 'Mont Hicks', -43.5958, 170.1414, 3198, 'Le mont Hicks est un sommet de Nouvelle-Zélande, situé sur l''île du Sud.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Hicks.jpg', 2, 130, 29),
  (38, 'Mont Sefton', -43.5958, 170.1414, 3151, 'Le mont Sefton est un sommet de Nouvelle-Zélande, situé sur l''île du Sud.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Sefton.jpg', 3, 130, 29),
  -- en Antarctique
  (39, 'Mont Vinson', -78.5258, -85.6175, 4892, 'Le mont Vinson est le plus haut sommet de l''Antarctique, situé dans les monts Ellsworth.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Vinson.jpg', 4, 117, 33),
  (40, 'Mont Tyree', -77.5258, -85.6175, 4852, 'Le mont Tyree est un sommet de l''Antarctique, situé dans les monts Ellsworth.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Tyree.jpg', 5, 117, 33),
  (41, 'Mont Shinn', -79.5258, -85.6175, 4661, 'Le mont Shinn est un sommet de l''Antarctique, situé dans les monts Ellsworth.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Shinn.jpg', 1, 117, 33),
  (42, 'Mont Craddock', -78.5258, -85.6175, 4561, 'Le mont Craddock est un sommet de l''Antarctique, situé dans les monts Ellsworth.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Craddock.jpg', 2, 117, 33),
  (43, 'Mont Siple', -73.5258, -85.6175, 4161, 'Le mont Siple est un sommet de l''Antarctique, situé dans les monts Ellsworth.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Siple.jpg', 3, 117, 33),
  -- en Afrique
  (44, 'Mont Kilimandjaro', -3.0675, 37.3558, 5895, 'Le mont Kilimandjaro est le plus haut sommet d''Afrique, situé en Tanzanie.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Kilimanjaro.jpg', 4, 175, 24),
  (45, 'Mont Kenya', -0.1575, 37.3558, 5199, 'Le mont Kenya est le deuxième plus haut sommet d''Afrique, situé au Kenya.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Kenya.jpg', 5, 176, 24),
  (46, 'Mont Stanley', 0.3958, 29.5258, 5109, 'Le mont Stanley est un sommet des montagnes des Virunga, situé en République démocratique du Congo.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Stanley.jpg', 1, 44, 25),
  (47, 'Mont Karisimbi', -1.5075, 29.5258, 4507, 'Le mont Karisimbi est un sommet des montagnes des Virunga, situé au Rwanda.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Karisimbi.jpg', 2, 149, 12),
  (48, 'Mont Nyiragongo', -1.5258, 29.2558, 3470, 'Le mont Nyiragongo est un volcan des montagnes des Virunga, situé en République démocratique du Congo.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Nyiragongo.jpg', 3, 44, 21),
  -- en Asie
  (49, 'Mont Everest', 27.9881, 86.9258, 8848, 'Le mont Everest est le plus haut sommet du monde, situé entre le Népal et la Chine.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Mount_Everest.jpg', 4, 79, 7),
  (50, 'K2', 35.8814, 76.5131, 8611, 'Le K2 est le deuxième plus haut sommet du monde, situé entre le Pakistan et la Chine.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/K2.jpg', 5, 134, 19),
  (51, 'Kangchenjunga', 27.7025, 88.1464, 8586, 'Le Kangchenjunga est le troisième plus haut sommet du monde, situé entre le Népal et l''Inde.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Kangchenjunga.jpg', 1, 79, 7),
  (52, 'Lhotse', 27.9614, 86.9331, 8516, 'Le Lhotse est le quatrième plus haut sommet du monde, situé entre le Népal et la Chine.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Lhotse.jpg', 2, 79, 7),
  (53, 'Makalu', 27.8897, 87.0881, 8485, 'Le Makalu est le cinquième plus haut sommet du monde, situé entre le Népal et la Chine.', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Makalu.jpg', 3, 79, 7);

INSERT INTO
  "mountain_has_species" ("id", "mountain_id", "species_id")
VALUES
  (1, 1, 1),
  (2, 1, 2),
  (3, 1, 3),
  (4, 1, 4),
  (5, 1, 5),
  (6, 1, 6),
  (7, 1, 7),
  (8, 2, 1),
  (9, 2, 2),
  (10, 2, 3),
  (11, 2, 4),
  (12, 2, 5),
  (13, 2, 6),
  (14, 2, 7),
  (15, 3, 1),
  (16, 3, 2),
  (17, 3, 3),
  (18, 3, 4),
  (19, 3, 5),
  (20, 3, 6),
  (21, 3, 7),
  (22, 4, 1),
  (23, 4, 2),
  (24, 4, 3),
  (25, 4, 4),
  (26, 4, 5),
  (27, 4, 6),
  (28, 4, 7),
  (29, 5, 1),
  (30, 5, 2),
  (31, 5, 3),
  (32, 5, 4),
  (33, 5, 5),
  (34, 5, 6),
  (35, 5, 7),
  (36, 6, 1),
  (37, 6, 2),
  (38, 6, 3),
  (39, 6, 4),
  (40, 6, 5),
  (41, 6, 6),
  (42, 6, 7),
  (43, 7, 1),
  (44, 7, 2),
  (45, 7, 3),
  (46, 7, 4),
  (47, 7, 5),
  (48, 7, 6),
  (49, 7, 7),
  (50, 8, 1),
  (51, 8, 2),
  (52, 8, 3),
  (53, 8, 4);

INSERT INTO
  "country_has_region" ("id", "country_id", "region_id")
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5),
  (6, 6, 6),
  (7, 7, 7),
  (8, 8, 8),
  (9, 9, 9),
  (10, 10, 10),
  (11, 11, 11),
  (12, 12, 12),
  (13, 13, 13),
  (14, 14, 14),
  (15, 15, 15),
  (16, 16, 16),
  (17, 17, 17),
  (18, 18, 18),
  (19, 19, 19),
  (20, 20, 20),
  (21, 21, 21),
  (22, 22, 22),
  (23, 23, 23),
  (24, 24, 24),
  (25, 25, 25),
  (26, 26, 26),
  (27, 27, 27),
  (28, 28, 28),
  (29, 29, 29),
  (30, 30, 30),
  (31, 31, 31),
  (32, 32, 32),
  (33, 33, 33);
  
  INSERT INTO
  "user_visited_mountain" ("id", "user_id", "mountain_id")
VALUES
  -- mix randomly user and mountains
  (1, 3, 27),
  (2, 5, 13),
  (3, 4, 49),
  (4, 2, 38),
  (5, 4, 2),
  (6, 5, 21),
  (7, 3, 43),
  (8, 1, 35),
  (9, 2, 50),
  (10, 2, 22),
  (11, 2, 18),
  (12, 5, 16),
  (13, 1, 36),
  (14, 3, 47),
  (15, 4, 13),
  (16, 1, 2),
  (17, 2, 51),
  (18, 5, 19),
  (19, 3, 12),
  (20, 1, 11),
  (21, 4, 14),
  (22, 4, 15),
  (23, 4, 47),
  (24, 5, 31),
  (25, 3, 33),
  (26, 4, 37),
  (27, 5, 2),
  (28, 1, 14),
  (29, 4, 16),
  (30, 3, 53),
  (31, 2, 47),
  (32, 2, 12),
  (33, 5, 43),
  (34, 3, 31),
  (35, 5, 30),
  (36, 3, 36),
  (37, 1, 30),
  (38, 5, 45),
  (39, 3, 22),
  (40, 5, 17),
  (41, 5, 20),
  (42, 1, 8),
  (43, 2, 9),
  (44, 5, 50),
  (45, 1, 52),
  (46, 2, 30),
  (47, 4, 52),
  (48, 3, 15),
  (49, 2, 46),
  (50, 1, 21),
  (51, 2, 35),
  (52, 1, 7),
  (53, 5, 3),
  (54, 1, 16),
  (55, 4, 32),
  (56, 5, 39),
  (57, 3, 32),
  (58, 2, 10),
  (59, 2, 4),
  (60, 4, 26),
  (61, 3, 14),
  (62, 2, 2),
  (63, 4, 48),
  (64, 3, 3),
  (65, 5, 33),
  (66, 5, 25),
  (67, 5, 41),
  (68, 2, 25),
  (69, 4, 1),
  (70, 4, 50),
  (71, 5, 44),
  (72, 5, 8),
  (73, 1, 24),
  (74, 5, 24),
  (75, 4, 28),
  (76, 2, 48),
  (77, 4, 9),
  (78, 5, 34),
  (79, 3, 26),
  (80, 1, 34),
  (81, 5, 15),
  (82, 5, 46),
  (83, 2, 16),
  (84, 1, 5),
  (85, 3, 1),
  (86, 5, 32),
  (87, 3, 40),
  (88, 4, 18),
  (89, 1, 28),
  (90, 4, 42),
  (91, 4, 10),
  (92, 1, 1),
  (93, 3, 24),
  (94, 4, 29),
  (95, 1, 25),
  (96, 4, 3),
  (97, 2, 13),
  (98, 1, 49),
  (99, 3, 18),
  (100, 1, 47),
  (101, 5, 23),
  (102, 1, 26),
  (103, 3, 44),
  (104, 2, 8),
  (105, 1, 37),
  (106, 5, 11),
  (107, 3, 11),
  (108, 2, 31),
  (109, 4, 39),
  (110, 2, 41),
  (111, 3, 16),
  (112, 3, 51),
  (113, 1, 17),
  (114, 2, 45),
  (115, 4, 51),
  (116, 4, 23),
  (117, 1, 41),
  (118, 3, 5),
  (119, 5, 48),
  (120, 1, 19),
  (121, 4, 27),
  (122, 5, 6),
  (123, 3, 35),
  (124, 5, 4),
  (125, 2, 21),
  (126, 5, 36),
  (127, 2, 23),
  (128, 5, 14),
  (129, 1, 33),
  (130, 3, 20),
  (131, 4, 7),
  (132, 1, 42),
  (133, 1, 18),
  (134, 3, 28),
  (135, 3, 42),
  (136, 2, 24),
  (137, 5, 22),
  (138, 3, 25),
  (139, 3, 45),
  (140, 2, 7),
  (141, 1, 43),
  (142, 4, 34),
  (143, 5, 7),
  (144, 1, 32),
  (145, 1, 39),
  (146, 4, 44),
  (147, 5, 42),
  (148, 1, 3),
  (149, 5, 49),
  (150, 5, 26),
  (151, 3, 17),
  (152, 2, 20),
  (153, 1, 38),
  (154, 2, 32),
  (155, 1, 9),
  (156, 5, 47),
  (157, 4, 12),
  (158, 3, 10),
  (159, 2, 37),
  (160, 4, 6),
  (161, 3, 7),
  (162, 5, 10),
  (163, 3, 30),
  (164, 5, 35),
  (165, 1, 29),
  (166, 2, 44),
  (167, 4, 11),
  (168, 5, 9);

INSERT INTO
  "user_planned_mountain" ("id", "user_id", "mountain_id")
VALUES
  (1, 1, 24),
  (2, 3, 41),
  (3, 2, 52),
  (4, 5, 36),
  (5, 2, 38),
  (6, 4, 11),
  (7, 1, 33),
  (8, 5, 25),
  (9, 4, 21),
  (10, 4, 4),
  (11, 1, 45),
  (12, 4, 33),
  (13, 1, 35),
  (14, 4, 5),
  (15, 5, 17),
  (16, 1, 18),
  (17, 5, 48),
  (18, 4, 8),
  (19, 3, 43),
  (20, 5, 46),
  (21, 5, 1),
  (22, 5, 18),
  (23, 1, 30),
  (24, 4, 35),
  (25, 1, 26),
  (26, 3, 50),
  (27, 3, 28),
  (28, 3, 4),
  (29, 2, 33),
  (30, 1, 17),
  (31, 5, 21),
  (32, 1, 3),
  (33, 5, 24),
  (34, 3, 22),
  (35, 1, 49),
  (36, 4, 2),
  (37, 4, 22),
  (38, 1, 39),
  (39, 4, 51),
  (40, 4, 34),
  (41, 5, 49),
  (42, 1, 11),
  (43, 2, 2),
  (44, 3, 20),
  (45, 5, 16),
  (46, 1, 20),
  (47, 2, 39),
  (48, 4, 27),
  (49, 1, 43),
  (50, 2, 47),
  (51, 1, 42),
  (52, 1, 46),
  (53, 4, 38),
  (54, 3, 35),
  (55, 1, 8),
  (56, 4, 10),
  (57, 2, 1),
  (58, 3, 48),
  (59, 4, 48),
  (60, 4, 26),
  (61, 5, 7),
  (62, 5, 30),
  (63, 3, 25),
  (64, 4, 9),
  (65, 5, 19),
  (66, 4, 20),
  (67, 2, 43),
  (68, 1, 14),
  (69, 5, 22),
  (70, 4, 12),
  (71, 3, 46),
  (72, 4, 7),
  (73, 2, 50),
  (74, 1, 28),
  (75, 2, 31),
  (76, 3, 39),
  (77, 5, 27),
  (78, 4, 49),
  (79, 1, 4),
  (80, 4, 6),
  (81, 1, 12),
  (82, 5, 26),
  (83, 5, 10),
  (84, 1, 23),
  (85, 1, 19),
  (86, 4, 31),
  (87, 5, 20),
  (88, 1, 9),
  (89, 5, 14),
  (90, 3, 12),
  (91, 2, 18),
  (92, 4, 17),
  (93, 2, 20),
  (94, 4, 47),
  (95, 2, 7),
  (96, 4, 23),
  (97, 3, 42),
  (98, 3, 44),
  (99, 5, 12),
  (100, 2, 45),
  (101, 3, 33),
  (102, 5, 3),
  (103, 1, 16),
  (104, 2, 36),
  (105, 5, 15),
  (106, 1, 34),
  (107, 4, 16),
  (108, 2, 9),
  (109, 5, 45),
  (110, 3, 31),
  (111, 4, 28),
  (112, 1, 40),
  (113, 4, 14),
  (114, 2, 29),
  (115, 1, 6),
  (116, 3, 27),
  (117, 3, 18),
  (118, 5, 32),
  (119, 2, 8),
  (120, 3, 47),
  (121, 1, 38),
  (122, 1, 5),
  (123, 5, 2),
  (124, 1, 31),
  (125, 3, 32),
  (126, 1, 29),
  (127, 3, 24),
  (128, 4, 37),
  (129, 2, 46),
  (130, 2, 19),
  (131, 1, 10),
  (132, 2, 22),
  (133, 5, 33),
  (134, 1, 50),
  (135, 4, 1),
  (136, 2, 14),
  (137, 2, 12),
  (138, 3, 9),
  (139, 2, 51),
  (140, 1, 13),
  (141, 3, 5),
  (142, 4, 30),
  (143, 1, 15),
  (144, 5, 13),
  (145, 5, 31),
  (146, 1, 41),
  (147, 2, 26),
  (148, 3, 34),
  (149, 2, 37),
  (150, 3, 14),
  (151, 5, 11),
  (152, 3, 2),
  (153, 2, 27),
  (154, 2, 35),
  (155, 3, 7),
  (156, 4, 42),
  (157, 1, 47),
  (158, 2, 3),
  (159, 3, 45),
  (160, 5, 28),
  (161, 4, 3),
  (162, 2, 4),
  (163, 5, 6),
  (164, 4, 36),
  (165, 3, 15),
  (166, 5, 23),
  (167, 1, 22),
  (168, 3, 37);


COMMIT;