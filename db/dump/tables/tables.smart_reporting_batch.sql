
--
-- Structure de la table `srb_admin`
--

CREATE TABLE `srb_admin`
(
  `id` int
(11) NOT NULL,
  `admin_pseudo` varchar
(50) DEFAULT NULL,
  `encrypted_admin_password` varchar
(255) DEFAULT NULL,
  `admin_validated` int
(1) DEFAULT NULL,
  `admin_deleted` int
(1) DEFAULT NULL,
  `fk_srb_token_and_scope_id` int
(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `srb_admin`
--

INSERT INTO `srb_admin` (`
id`,
`admin_pseudo
`, `encrypted_admin_password`, `admin_validated`, `admin_deleted`, `fk_srb_token_and_scope_id`) VALUES
(1, 'Pascal', 'ih%?4qZ10$Do006csCl8BpSmIpJtRrh.k04BPaYp2psVB1M15Iw/JCD.RpdbBgK', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `srb_batch`
--

CREATE TABLE `srb_batch`
(
  `id` int
(11) NOT NULL,
  `json` json DEFAULT NULL,
  `posts_quantity` tinyint
(5) DEFAULT NULL,
  `fk_srb_network_id` int
(11) NOT NULL,
  `fk_srb_service_provider_id` int
(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `srb_batch`
--

INSERT INTO `srb_batch` (`
id`,
`json
`, `posts_quantity`, `fk_srb_network_id`, `fk_srb_service_provider_id`) VALUES
(1, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(2, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(3, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(4, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(5, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(6, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(7, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(8, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(9, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(10, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(11, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(12, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(13, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(14, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(15, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(16, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(17, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(18, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(19, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(20, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(21, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(22, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(23, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(24, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(25, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(26, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(27, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(28, '{\"An issue has occured\": \"\"}', NULL, 1, 2),
(29, '[{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}, {\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}, {\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}, {\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}, {\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}]', NULL, 1, 1),
(30, '{\"An issue has occured\": \"\"}', NULL, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `srb_credential`
--

CREATE TABLE `srb_credential`
(
  `id` int
(11) NOT NULL,
  `service_provider_username` tinytext,
  `service_provider_password` tinytext,
  `service_provider_authorization_link` text,
  `service_provider_code` text,
  `service_provider_page_id` varchar
(20) DEFAULT NULL,
  `service_provider_token` text,
  `service_provider_refresh_token` text,
  `service_provider_long_time_token` text,
  `fk_srb_network_id` int
(11) NOT NULL,
  `fk_srb_service_provider_id` int
(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `srb_credential`
--

INSERT INTO `srb_credential` (`
id`,
`service_provider_username`,
`service_provider_password
`, `service_provider_authorization_link`, `service_provider_code`, `service_provider_page_id`, `service_provider_token`, `service_provider_refresh_token`, `service_provider_long_time_token`, `fk_srb_network_id`, `fk_srb_service_provider_id`) VALUES
(1, 'ecom@news.fr', 'mon_motd3Pass3', '', '', '110003613768069', 'EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', '', '', 1, 1),
(2, 'paris@mode.fr', '987654', '', '', '123654', 'Voilà_leTok3n-dE_P4r15_Mod3', '', '', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `srb_log`
--

CREATE TABLE `srb_log`
(
  `id` int
(11) NOT NULL,
  `request` longtext,
  `status` int
(11) DEFAULT NULL,
  `request_start_datetime` datetime
(6) DEFAULT NULL,
  `request_duration` float DEFAULT NULL,
  `batch_storage_start_datetime` datetime
(6) DEFAULT NULL,
  `batch_storage_duration` float DEFAULT NULL,
  `media_history_storage_start_datetime` datetime
(6) DEFAULT NULL,
  `media_history_storage_duration` float DEFAULT NULL,
  `media_storage_start_datetime` datetime
(6) DEFAULT NULL,
  `media_storage_duration` float DEFAULT NULL,
  `on_off_notification` int
(1) DEFAULT NULL,
  `fk_srb_network_id` int
(11) NOT NULL,
  `fk_srb_batch_id` int
(11) NOT NULL,
  `fk_srb_service_provider_id` int
(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `srb_log`
--

INSERT INTO `srb_log` (`
id`,
`request`,
`status`,
`request_start_datetime`,
`request_duration`,
`batch_storage_start_datetime`,
`batch_storage_duration
`, `media_history_storage_start_datetime`, `media_history_storage_duration`, `media_storage_start_datetime`, `media_storage_duration`, `on_off_notification`, `fk_srb_network_id`, `fk_srb_batch_id`, `fk_srb_service_provider_id`) VALUES
(1, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 15:28:53.102745', 1.607, '2020-01-25 15:28:54.716041', 0.016542, '2020-01-25 15:28:54.735994', 0.015744, '2020-01-25 15:28:54.753394', 0.010222, 0, 1, 1, 1),
(2, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 15:28:53.113270', 0.165, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2),
(3, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 15:36:19.713727', 1.141, '2020-01-25 15:36:20.861258', 0.008072, '2020-01-25 15:36:20.874052', 0.022476, '2020-01-25 15:36:20.897840', 0.011428, 0, 1, 3, 1),
(4, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 15:36:19.725952', 0.132, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 4, 2),
(5, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 15:41:19.119847', 1.39, '2020-01-25 15:41:20.520018', 0.008995, '2020-01-25 15:41:20.532699', 0.020693, '2020-01-25 15:41:20.555622', 0.010395, 0, 1, 5, 1),
(6, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 15:41:19.137126', 0.132, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 6, 2),
(7, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 15:45:45.297734', 1.558, '2020-01-25 15:45:46.865632', 0.004263, '2020-01-25 15:45:46.873010', 0.013934, '2020-01-25 15:45:46.889573', 0.018991, 0, 1, 7, 1),
(8, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 15:45:45.319582', 0.14, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 8, 2),
(9, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 15:47:21.860117', 0.426, '2020-01-25 15:47:22.293872', 0.007075, '2020-01-25 15:47:22.305165', 0.02169, '2020-01-25 15:47:22.329576', 0.016083, 0, 1, 9, 1),
(10, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 15:47:21.876831', 0.142, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 10, 2),
(11, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 15:51:48.104667', 0.325, '2020-01-25 15:51:48.437771', 0.007477, '2020-01-25 15:51:48.456700', 0.021097, '2020-01-25 15:51:48.480295', 0.025246, 0, 1, 11, 1),
(12, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 15:51:48.121594', 0.155, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 12, 2),
(13, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 15:51:52.697089', 0.244, '2020-01-25 15:51:52.943033', 0.005557, '2020-01-25 15:51:52.951543', 0.012146, '2020-01-25 15:51:52.965112', 0.013509, 0, 1, 13, 1),
(14, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 15:51:52.701482', 0.105, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 14, 2),
(15, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 16:01:44.283592', 0.348, '2020-01-25 16:01:44.639145', 0.009464, '2020-01-25 16:01:44.652308', 0.016441, '2020-01-25 16:01:44.670866', 0.015194, 0, 1, 15, 1),
(16, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 16:01:44.296575', 0.163, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 16, 2),
(17, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 19:25:38.264406', 0.585, '2020-01-25 19:25:38.864803', 0.008435, '2020-01-25 19:25:38.876651', 0.020869, '2020-01-25 19:25:38.899287', 0.016016, 0, 1, 17, 1),
(18, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 19:25:38.284231', 0.394, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 18, 2),
(19, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 19:33:32.353757', 1.229, '2020-01-25 19:33:33.587597', 0.006739, '2020-01-25 19:33:33.598988', 0.020219, '2020-01-25 19:33:33.621616', 0.015561, 0, 1, 19, 1),
(20, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 19:33:32.360218', 1.119, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 20, 2),
(21, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 20:01:03.161242', 0.332, '2020-01-25 20:01:03.508381', 0.008691, '2020-01-25 20:01:03.520072', 0.02311, '2020-01-25 20:01:03.545485', 0.013648, 0, 1, 21, 1),
(22, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 20:01:03.191523', 0.158, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 22, 2),
(23, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 20:08:15.806845', 0.349, '2020-01-25 20:08:16.160431', 0.008598, '2020-01-25 20:08:16.172370', 0.016846, '2020-01-25 20:08:16.189987', 0.015389, 0, 1, 23, 1),
(24, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 20:08:15.812606', 0.114, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 24, 2),
(25, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 20:12:15.320597', 0.315, '2020-01-25 20:12:15.645488', 0.011876, '2020-01-25 20:12:15.661345', 0.022489, '2020-01-25 20:12:15.686198', 0.015662, 0, 1, 25, 1),
(26, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 20:12:15.334598', 0.139, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 26, 2),
(27, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-25 20:36:01.913833', 0.27, '2020-01-25 20:36:02.190121', 0.008189, '2020-01-25 20:36:02.202620', 0.019349, '2020-01-25 20:36:02.222900', 0.020093, 0, 1, 27, 1),
(28, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-25 20:36:01.922255', 0.148, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 28, 2),
(29, 'https://graph.facebook.com/v5.0/110003613768069/posts?access_token=EAAKPasRwcOEBALLaFi6puC6JidDe1ToBOmOUz2l1g2w9x2HfLrJPWV0vIIJgX07WolXEsiYu1k6pi5WrtHGkRvvUHtTQr4wxBE0rng4WdEjY9wkcSYnaA5X9KTCIX6JtoZBua4ZAk9loITVnZADoNIU5evUlKcn2cIB7bO9n6elS6FtaM4lifhvrgGm7r4ZD', 1111, '2020-01-27 11:03:41.740413', 0.391, '2020-01-27 11:03:42.139618', 0.011402, '2020-01-27 11:03:42.155365', 0.017397, '2020-01-27 11:03:42.173675', 0.019695, 0, 1, 29, 1),
(30, 'https://graph.facebook.com/v5.0/123654/posts?access_token=Voilà_leTok3n-dE_P4r15_Mod3', -1, '2020-01-27 11:03:41.756103', 0.074, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 30, 2);

-- --------------------------------------------------------

--
-- Structure de la table `srb_media`
--

CREATE TABLE `srb_media`
(
  `id` int
(11) NOT NULL,
  `json_id` varchar
(255) NOT NULL,
  `posted_date` varchar
(26) DEFAULT NULL,
  `json` json DEFAULT NULL,
  `fk_srb_service_provider_id` int
(11) NOT NULL,
  `fk_srb_batch_id` int
(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `srb_media`
--

INSERT INTO `srb_media` (`
id`,
`json_id
`, `posted_date`, `json`, `fk_srb_service_provider_id`, `fk_srb_batch_id`) VALUES
(1, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 1, 1),
(2, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 1, 1),
(3, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 1, 1),
(4, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 1, 1),
(5, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `srb_media_history`
--

CREATE TABLE `srb_media_history`
(
  `id` int
(11) NOT NULL,
  `json_id` varchar
(255) CHARACTER
SET latin1 DEFAULT
NULL,
  `posted_date` datetime DEFAULT NULL,
  `json` json DEFAULT NULL,
  `fk_srb_batch_id` int
(11) NOT NULL,
  `fk_srb_service_provider_id` int
(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `srb_media_history`
--

INSERT INTO `srb_media_history` (`
id`,
`json_id
`, `posted_date`, `json`, `fk_srb_batch_id`, `fk_srb_service_provider_id`) VALUES
(1, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 1, 1),
(2, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 1, 1),
(3, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 1, 1),
(4, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 1, 1),
(5, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 1, 1),
(6, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 3, 1),
(7, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 3, 1),
(8, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 3, 1),
(9, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 3, 1),
(10, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 3, 1),
(11, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 5, 1),
(12, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 5, 1),
(13, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 5, 1),
(14, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 5, 1),
(15, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 5, 1),
(16, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 7, 1),
(17, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 7, 1),
(18, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 7, 1),
(19, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 7, 1),
(20, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 7, 1),
(21, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 9, 1),
(22, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 9, 1),
(23, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 9, 1),
(24, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 9, 1),
(25, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 9, 1),
(26, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 11, 1),
(27, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 11, 1),
(28, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 11, 1),
(29, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 11, 1),
(30, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 11, 1),
(31, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 13, 1),
(32, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 13, 1),
(33, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 13, 1),
(34, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 13, 1),
(35, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 13, 1),
(36, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 15, 1),
(37, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 15, 1),
(38, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 15, 1),
(39, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 15, 1),
(40, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 15, 1),
(41, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 17, 1),
(42, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 17, 1),
(43, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 17, 1),
(44, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 17, 1),
(45, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 17, 1),
(46, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 19, 1),
(47, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 19, 1),
(48, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 19, 1),
(49, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 19, 1),
(50, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 19, 1),
(51, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 21, 1),
(52, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 21, 1),
(53, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 21, 1),
(54, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 21, 1),
(55, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 21, 1),
(56, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 23, 1),
(57, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 23, 1),
(58, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 23, 1),
(59, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 23, 1),
(60, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 23, 1),
(61, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 25, 1),
(62, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 25, 1),
(63, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 25, 1),
(64, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 25, 1),
(65, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 25, 1),
(66, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 27, 1),
(67, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 27, 1),
(68, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 27, 1),
(69, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 27, 1),
(70, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 27, 1),
(71, '\"110003613768069_111452636956500\"', '2019-10-31 11:20:02', '{\"id\": \"110003613768069_111452636956500\", \"message\": \"Un post fait le 31 octobre 2019 @clientX001 avec #regionsud #agephip une photo\", \"created_time\": \"2019-10-31T11:20:02+0000\"}', 29, 1),
(72, '\"110003613768069_110482273720203\"', '2019-10-30 16:07:43', '{\"id\": \"110003613768069_110482273720203\", \"message\": \"4eme post pour #tunisie avec une vidéo @clientX001 @clientX002\", \"created_time\": \"2019-10-30T16:07:43+0000\"}', 29, 1),
(73, '\"110003613768069_110478217053942\"', '2019-10-30 16:03:19', '{\"id\": \"110003613768069_110478217053942\", \"message\": \"#nightclubix. Ceci est la troisième publication. J&#039;y jointune vidéo pour le client @clientX002\", \"created_time\": \"2019-10-30T16:03:19+0000\"}', 29, 1),
(74, '\"110003613768069_110092083759222\"', '2019-10-30 09:48:32', '{\"id\": \"110003613768069_110092083759222\", \"message\": \"Deuxième publication #monsud #tunis pour TestPage pour @clientX001 et @clientX002 ayant pour lien une vidéo youtube :&#092;nhttps://www.youtube.com/watch?v=wWxLAc7deRU\", \"created_time\": \"2019-10-30T09:48:32+0000\"}', 29, 1),
(75, '\"110003613768069_110018430433254\"', '2019-10-30 08:34:02', '{\"id\": \"110003613768069_110018430433254\", \"message\": \"Voici la première publication de ma PAGE pour #agephip avec un lien qui pointe vers img.ohmymag pour le clien @clientX001 https://img.ohmymag.com/article/300/mouche/colibri_0d29d4083d41418c5fdbd19bf20d2bc465b6fca8.jpg\", \"created_time\": \"2019-10-30T08:34:02+0000\"}', 29, 1);

-- --------------------------------------------------------

--
-- Structure de la table `srb_media_member_network_provider`
--

CREATE TABLE `srb_media_member_network_provider`
(
  `fk_srb_media_id` int
(11) NOT NULL,
  `fk_srb_member_keyword_id` int
(11) NOT NULL,
  `fk_srb_member_keyword_fk_srb_service_member_id` int
(11) NOT NULL,
  `fk_srb_member_keyword_fk_srb_network_id` int
(11) NOT NULL,
  `fk_srb_member_keyword_fk_srb_service_provider_id` int
(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `srb_media_member_network_provider`
--

INSERT INTO `srb_media_member_network_provider` (`
fk_srb_media_id`,
`fk_srb_member_keyword_id
`, `fk_srb_member_keyword_fk_srb_service_member_id`, `fk_srb_member_keyword_fk_srb_network_id`, `fk_srb_member_keyword_fk_srb_service_provider_id`) VALUES
(1, 3, 2, 1, 1),
(4, 4, 2, 1, 1),
(2, 6, 4, 1, 1),
(2, 7, 4, 1, 1),
(4, 7, 4, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `srb_member_keyword`
--

CREATE TABLE `srb_member_keyword`
(
  `id` int
(11) NOT NULL,
  `keyword` tinytext CHARACTER
SET
latin1,
  `fk_srb_service_member_id` int
(11) NOT NULL,
  `fk_srb_network_id` int
(11) NOT NULL,
  `fk_srb_service_provider_id` int
(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `srb_member_keyword`
--

INSERT INTO `srb_member_keyword` (`
id`,
`keyword
`, `fk_srb_service_member_id`, `fk_srb_network_id`, `fk_srb_service_provider_id`) VALUES
(1, '#AGEPHIP', 1, 1, 1),
(2, '#handicap', 1, 1, 1),
(3, '#regionsud', 2, 1, 1),
(4, '#monsud', 2, 1, 1),
(5, '#sud', 2, 1, 1),
(6, '#tunisie', 4, 1, 1),
(7, '#tunis', 4, 1, 1),
(8, '#nightclubix', 3, 1, 2),
(9, '#obelrose', 5, 1, 2),
(10, '#Occitanie', 7, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `srb_network`
--

CREATE TABLE `srb_network`
(
  `id` int
(11) NOT NULL,
  `network_name` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `srb_network`
--

INSERT INTO `srb_network` (`
id`,
`network_name
`) VALUES
(1, 'Facebook'),
(2, 'Twitter'),
(3, 'Instagram'),
(4, 'Youtube');

-- --------------------------------------------------------

--
-- Structure de la table `srb_service_member`
--

CREATE TABLE `srb_service_member`
(
  `id` int
(11) NOT NULL,
  `name` text CHARACTER
SET
latin1,
  `fk_srb_service_provider_id` int
(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `srb_service_member`
--

INSERT INTO `srb_service_member` (`
id`,
`name
`, `fk_srb_service_provider_id`) VALUES
(1, 'AGEPHIP', 1),
(2, 'Région Sud', 1),
(3, 'Night Clubix', 2),
(4, 'Tunisie', 1),
(5, 'Obel Rose', 2),
(6, 'Dé et Couture', 2),
(7, 'Occitanie', 1),
(8, 'Montpellier', 1),
(9, 'Cacharel', 2),
(10, 'Louis Vuiton', 2);

-- --------------------------------------------------------

--
-- Structure de la table `srb_service_provider`
--

CREATE TABLE `srb_service_provider`
(
  `id` int
(11) NOT NULL,
  `name` tinytext CHARACTER
SET
latin1,
  `infos` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `srb_service_provider`
--

INSERT INTO `srb_service_provider` (`
id`,
`name
`, `infos`) VALUES
(1, 'Ecomnews', '{\"info\": \"Cap Oméga, Montpellier, 34000, 0605482422, Denys BEDARRIDE\"}'),
(2, 'Paris Mode', '{\"info\": \"51 rue de la classe, Paris, 75016, 0687542233, Pierre BIJOUX\"}');

-- --------------------------------------------------------

--
-- Structure de la table `srb_token_and_scope`
--

CREATE TABLE `srb_token_and_scope`
(
  `id` int
(11) NOT NULL,
  `token` text,
  `has_full_scope` int
(1) DEFAULT NULL,
  `has_provider_scope` int
(1) DEFAULT NULL,
  `has_member_scope` int
(1) DEFAULT NULL,
  `has_light_scope` int
(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `srb_token_and_scope`
--

INSERT INTO `srb_token_and_scope` (`
id`,
`token
`, `has_full_scope`, `has_provider_scope`, `has_member_scope`, `has_light_scope`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbklkIjoxLCJmdWxsU2NvcGUiOjEsInByb3ZpZGVyU2NvcGUiOjEsIm1lbWJlclNjb3BlIjoxLCJsaWdodFNjb3BlIjpudWxsLCJhZG1pblZhbGlkYXRlZCI6bnVsbCwiaWF0IjoxNTgwMTIwNjA2LCJleHAiOjE1ODAxMjQyMDZ9.tEKLJI0WW8lzKe0Z3HTnVAPFzSm2YKQ-FJN83KrZuVw', 1, 1, 1, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `srb_admin`
--
ALTER TABLE `srb_admin`
ADD PRIMARY KEY
(`id`,`fk_srb_token_and_scope_id`),
ADD UNIQUE KEY `id_UNIQUE`
(`id`),
ADD KEY `fk_srb_admin_srb_token_and_scope1_idx`
(`fk_srb_token_and_scope_id`);

--
-- Index pour la table `srb_batch`
--
ALTER TABLE `srb_batch`
ADD PRIMARY KEY
(`id`,`fk_srb_network_id`,`fk_srb_service_provider_id`),
ADD UNIQUE KEY `idFULLBATCHES_UNIQUE`
(`id`),
ADD KEY `fk_srb_batch_srb_service_provider1_idx`
(`fk_srb_service_provider_id`),
ADD KEY `fk_srb_batch_srb_network1_idx`
(`fk_srb_network_id`);

--
-- Index pour la table `srb_credential`
--
ALTER TABLE `srb_credential`
ADD PRIMARY KEY
(`id`,`fk_srb_network_id`,`fk_srb_service_provider_id`),
ADD UNIQUE KEY `idCREDENTIALS_UNIQUE`
(`id`),
ADD KEY `fk_CREDENTIALS_NETWORKS1_idx`
(`fk_srb_network_id`),
ADD KEY `fk_srb_credential_srb_service_provider1_idx`
(`fk_srb_service_provider_id`);

--
-- Index pour la table `srb_fake`
--
ALTER TABLE `srb_fake`
ADD PRIMARY KEY
(`media_id`,`member_id`,`provider_id`,`network_id`,`keyword_id`);

--
-- Index pour la table `srb_log`
--
ALTER TABLE `srb_log`
ADD PRIMARY KEY
(`id`,`fk_srb_network_id`,`fk_srb_batch_id`,`fk_srb_service_provider_id`),
ADD KEY `fk_LOGS_NETWORK1_idx`
(`fk_srb_network_id`),
ADD KEY `fk_log_sr_batch1_idx`
(`fk_srb_batch_id`),
ADD KEY `fk_srb_log_srb_service_provider1_idx`
(`fk_srb_service_provider_id`);

--
-- Index pour la table `srb_media`
--
ALTER TABLE `srb_media`
ADD PRIMARY KEY
(`id`,`fk_srb_service_provider_id`,`fk_srb_batch_id`,`json_id`),
ADD UNIQUE KEY `idMEDIAS_UNIQUE`
(`id`),
ADD UNIQUE KEY `json_id_UNIQUE`
(`json_id`),
ADD KEY `fk_srb_media_srb_batch1_idx`
(`fk_srb_batch_id`),
ADD KEY `fk_srb_media_srb_service_provider1_idx`
(`fk_srb_service_provider_id`);

--
-- Index pour la table `srb_media_history`
--
ALTER TABLE `srb_media_history`
ADD PRIMARY KEY
(`id`,`fk_srb_batch_id`,`fk_srb_service_provider_id`),
ADD UNIQUE KEY `id_UNIQUE`
(`id`),
ADD KEY `fk_srb_media_history_srb_batch1_idx`
(`fk_srb_batch_id`),
ADD KEY `fk_srb_media_history_srb_service_provider1_idx`
(`fk_srb_service_provider_id`);

--
-- Index pour la table `srb_media_member_network_provider`
--
ALTER TABLE `srb_media_member_network_provider`
ADD PRIMARY KEY
(`fk_srb_media_id`,`fk_srb_member_keyword_id`,`fk_srb_member_keyword_fk_srb_service_member_id`,`fk_srb_member_keyword_fk_srb_network_id`,`fk_srb_member_keyword_fk_srb_service_provider_id`),
ADD KEY `fk_srb_media_member_network_provider_srb_member_keyword1_idx`
(`fk_srb_member_keyword_id`,`fk_srb_member_keyword_fk_srb_service_member_id`,`fk_srb_member_keyword_fk_srb_network_id`,`fk_srb_member_keyword_fk_srb_service_provider_id`);

--
-- Index pour la table `srb_member_keyword`
--
ALTER TABLE `srb_member_keyword`
ADD PRIMARY KEY
(`id`,`fk_srb_service_member_id`,`fk_srb_network_id`,`fk_srb_service_provider_id`),
ADD UNIQUE KEY `idOrganisation_keyword_UNIQUE`
(`id`),
ADD KEY `fk_ORGANISATIONS_KEYWORDS_ORGANISATIONS_idx`
(`fk_srb_service_member_id`),
ADD KEY `fk_srb_customer_keyword_srb_network1_idx`
(`fk_srb_network_id`),
ADD KEY `fk_srb_member_keyword_srb_service_provider1_idx`
(`fk_srb_service_provider_id`);

--
-- Index pour la table `srb_network`
--
ALTER TABLE `srb_network`
ADD PRIMARY KEY
(`id`),
ADD UNIQUE KEY `idNetwork_UNIQUE`
(`id`);

--
-- Index pour la table `srb_service_member`
--
ALTER TABLE `srb_service_member`
ADD PRIMARY KEY
(`id`,`fk_srb_service_provider_id`),
ADD UNIQUE KEY `idClient_UNIQUE`
(`id`),
ADD KEY `fk_srb_service_member_srb_service_provider1_idx`
(`fk_srb_service_provider_id`);

--
-- Index pour la table `srb_service_provider`
--
ALTER TABLE `srb_service_provider`
ADD PRIMARY KEY
(`id`),
ADD UNIQUE KEY `idCLAWS_CLIENTS_UNIQUE`
(`id`);

--
-- Index pour la table `srb_token_and_scope`
--
ALTER TABLE `srb_token_and_scope`
ADD PRIMARY KEY
(`id`),
ADD UNIQUE KEY `id_UNIQUE`
(`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `srb_admin`
--
ALTER TABLE `srb_admin`
  MODIFY `id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `srb_batch`
--
ALTER TABLE `srb_batch`
  MODIFY `id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `srb_credential`
--
ALTER TABLE `srb_credential`
  MODIFY `id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `srb_log`
--
ALTER TABLE `srb_log`
  MODIFY `id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `srb_media`
--
ALTER TABLE `srb_media`
  MODIFY `id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `srb_media_history`
--
ALTER TABLE `srb_media_history`
  MODIFY `id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT pour la table `srb_member_keyword`
--
ALTER TABLE `srb_member_keyword`
  MODIFY `id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `srb_network`
--
ALTER TABLE `srb_network`
  MODIFY `id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `srb_service_member`
--
ALTER TABLE `srb_service_member`
  MODIFY `id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `srb_service_provider`
--
ALTER TABLE `srb_service_provider`
  MODIFY `id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `srb_token_and_scope`
--
ALTER TABLE `srb_token_and_scope`
  MODIFY `id` int
(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `srb_admin`
--
ALTER TABLE `srb_admin`
ADD CONSTRAINT `fk_srb_admin_srb_token_and_scope1` FOREIGN KEY
(`fk_srb_token_and_scope_id`) REFERENCES `srb_token_and_scope`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION;

--
-- Contraintes pour la table `srb_batch`
--
ALTER TABLE `srb_batch`
ADD CONSTRAINT `fk_srb_batch_srb_network1` FOREIGN KEY
(`fk_srb_network_id`) REFERENCES `srb_network`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION,
ADD CONSTRAINT `fk_srb_batch_srb_service_provider1` FOREIGN KEY
(`fk_srb_service_provider_id`) REFERENCES `srb_service_provider`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION;

--
-- Contraintes pour la table `srb_credential`
--
ALTER TABLE `srb_credential`
ADD CONSTRAINT `fk_CREDENTIALS_NETWORKS1` FOREIGN KEY
(`fk_srb_network_id`) REFERENCES `srb_network`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION,
ADD CONSTRAINT `fk_srb_credential_srb_service_provider1` FOREIGN KEY
(`fk_srb_service_provider_id`) REFERENCES `srb_service_provider`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION;

--
-- Contraintes pour la table `srb_log`
--
ALTER TABLE `srb_log`
ADD CONSTRAINT `fk_LOGS_NETWORK1` FOREIGN KEY
(`fk_srb_network_id`) REFERENCES `srb_network`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION,
ADD CONSTRAINT `fk_log_sr_batch1` FOREIGN KEY
(`fk_srb_batch_id`) REFERENCES `srb_batch`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION,
ADD CONSTRAINT `fk_srb_log_srb_service_provider1` FOREIGN KEY
(`fk_srb_service_provider_id`) REFERENCES `srb_service_provider`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION;

--
-- Contraintes pour la table `srb_media`
--
ALTER TABLE `srb_media`
ADD CONSTRAINT `fk_srb_media_srb_batch1` FOREIGN KEY
(`fk_srb_batch_id`) REFERENCES `srb_batch`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION;

--
-- Contraintes pour la table `srb_media_history`
--
ALTER TABLE `srb_media_history`
ADD CONSTRAINT `fk_srb_media_history_srb_batch1` FOREIGN KEY
(`fk_srb_batch_id`) REFERENCES `srb_batch`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION,
ADD CONSTRAINT `fk_srb_media_history_srb_service_provider1` FOREIGN KEY
(`fk_srb_service_provider_id`) REFERENCES `srb_service_provider`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION;

--
-- Contraintes pour la table `srb_media_member_network_provider`
--
ALTER TABLE `srb_media_member_network_provider`
ADD CONSTRAINT `fk_srb_media_member_network_provider_srb_media1` FOREIGN KEY
(`fk_srb_media_id`) REFERENCES `srb_media`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION,
ADD CONSTRAINT `fk_srb_media_member_network_provider_srb_member_keyword1` FOREIGN KEY
(`fk_srb_member_keyword_id`,`fk_srb_member_keyword_fk_srb_service_member_id`,`fk_srb_member_keyword_fk_srb_network_id`,`fk_srb_member_keyword_fk_srb_service_provider_id`) REFERENCES `srb_member_keyword`
(`id`, `fk_srb_service_member_id`, `fk_srb_network_id`, `fk_srb_service_provider_id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION;

--
-- Contraintes pour la table `srb_member_keyword`
--
ALTER TABLE `srb_member_keyword`
ADD CONSTRAINT `fk_ORGANISATIONS_KEYWORDS_ORGANISATIONS` FOREIGN KEY
(`fk_srb_service_member_id`) REFERENCES `srb_service_member`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION,
ADD CONSTRAINT `fk_srb_customer_keyword_srb_network1` FOREIGN KEY
(`fk_srb_network_id`) REFERENCES `srb_network`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION,
ADD CONSTRAINT `fk_srb_member_keyword_srb_service_provider1` FOREIGN KEY
(`fk_srb_service_provider_id`) REFERENCES `srb_service_provider`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION;

--
-- Contraintes pour la table `srb_service_member`
--
ALTER TABLE `srb_service_member`
ADD CONSTRAINT `fk_srb_service_member_srb_service_provider1` FOREIGN KEY
(`fk_srb_service_provider_id`) REFERENCES `srb_service_provider`
(`id`) ON
DELETE NO ACTION ON
UPDATE NO ACTION;
