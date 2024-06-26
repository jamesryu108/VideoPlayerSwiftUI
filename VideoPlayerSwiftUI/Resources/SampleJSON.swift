//
//  SampleJSON.swift
//  VideoPlayerSwiftUI
//
//  Created by James Ryu on 2024-03-31.
//

import Foundation

/// This enum contains a single static property, `fallbackData`, which is a `Data` object
/// representing a hardcoded JSON response. This data is used as a fallback mechanism
/// when the application is running under specific conditions where the server is not reachable,
/// such as in a staging environment or during offline testing.
enum SampleJSON {

	static let sampleData: [Video] = [
		Video(
			id: "2f1fe9c0-bdbf-4104-bee2-3c0ec514436f",
			title: "About EM:RAP",
			hlsURL: "https://d140vvwqovffrf.cloudfront.net/media/5e852de33c8e4/hls/index.m3u8",
			fullURL: "https://d140vvwqovffrf.cloudfront.net/media/5e852de33c8e4/full/720.mp4",
			description: "# Omnibus quae\n\n## Sit sed inque teneris\n\nLorem markdownum adhuc securosque, suo ponto satae se adhuc, terga. Fuit campus,\nqui, quod **formasque coeunt artus**, certamina nurus nunc coniuge peregit ritu.\nSuperat funera perque ferrem corpora saevam caespite nam maternaque sumpserat.\n\nIuga adest? Humano percussit Haemum frugis, vix qua quae iniustaque et tibi,\ntenuisset vix lacrimis umbra, ire. Ante nec. Est deam vivum ad ponti, non\ncaelamina et Sisyphon, inhonestaque atque, sed et vivit.\n\n1. Litora gloria Hyperionis carmina ungulaque patiere\n2. Dari nasci\n3. Fragilesque tendo dixit resonant quoque\n4. Et segnibus fuge ter Armeniae templi\n5. Sit deponere credit non aquarum Achilles tenus\n6. Exsultat artes Iovi\n\nStupet honoris. Nunc angebar Dryasque.\n\n## Multamque siqua hospitibus patrio\n\nExstimulata blando; qui armis Ixion **finire laetusque** sororem, aut **et**,\nigne membra? Nec bello ramis pari, Libye percensuit metallis, *in* mediis\nprocumbere.\n\n- Et illa\n- Clanis sceleris\n- Velletque prolisque auditum\n- Res delius iraque Semeles veluti\n- Cava umor quid superest fama artus\n\nTutam auditurum ab erit sum frigore in fleturi vectus eodem *quinos capillos me*\nagros. Ut rogis **foret cogor** neve ultoris rabiem, pro perque meque ossa\n[alter fassusque](http://www.querellissacra.com/reminiscitur) proxima erigitur,\nest *occulte concutio*. Celsa Echo huc credunt natus leones racemifero condi\nPhlegyanque esse; suis, per. Versum fessam me reponit omnis demisere litore\ncorpora esse expers veteris Noctisque.\n\n1. Inhaerebat undas ungula pulsat subiit modo\n2. Madefacta Cyanen\n3. Qua ex Tartessia nulla dixi illum lumina\n4. Et et viridi serpens ast longoque agros\n5. Aras nos arma medium consonat cum desit\n6. Facta ille ego\n\nFibris animo. Tui nota quod iter caeli mirata pede paulatim purpureum tergo\nseptemplicis? Progenies ait. Patrios sis est exclamat exiguo Myrrha in tibi\nexarsit cum. Flagrantemque cape: iter capacem cum rerum quota pennisque pone non\npatria.",
			publishedAt: "2018-12-14T21:09:00.000Z",
			author: Author(
				id: "2cab326a-ab2f-4624-a6d7-2e1855fc5e4e",
				name: "Mel Herbert"
			)
		),
		Video(
			id: "6ec246b1-ad09-4e03-8573-21e2e779856c",
			title: "EM:RAP Global Outreach",
			hlsURL: "https://d140vvwqovffrf.cloudfront.net/media/5e87b9a811599/hls/index.m3u8",
			fullURL: "https://d140vvwqovffrf.cloudfront.net/media/5e87b9a811599/full/720.mp4",
			description: "# Famemque horrescere occasus neve\n\n## Ityosque oraque subvolat patetis\n\nLorem markdownum purpura Scyrum, ira aper cruribus purpurea at neve\npraecordiaque illa de erat. Lapithae pollice; nec *aret principiis* sua preces\nregia nam? Templa cruorem sparsos **ardua** protinus *subtraheret fruge*\nexemplum, esse, toros. Ubi quibus sparsaque tutela.\n\n- Suo rogat lumina puto ut frater Lycetum\n- Illos dilecta diva\n- Quoniam Daedalus\n- Vulnere coniuge trisulcis nunc leves\n- Una veluti mea Achivi ferum pectus\n- Pressit tu Iovis mutantur sedere Credulitas ambage\n\n*Vitataque Fame cornibus* volubilitas ad nec insania petito adrectisque ipsa\nanimasque pugnabant ferrum parant. Sensit haec promissaque currus. Tauri levius\ntetigisset dixere est mora ponti, ea posuit pedem circuit: viribus, iterum, e\nseque! Temptare perpetuo ferit non telis Hippotaden milibus valuissent\n[ait](http://incensaquefaveas.com/aera), corpore volenti instruxere Anienis\nnamor, bis saxum?\n\n## Regemque miscuit capit amanti\n\nTalibus haustus, nec ficti: ille una lacertis praeter dixerat inputet.\n[Instabiles illam](http://cerniset.net/sacraangustis), suique [mentitus manus\nserpente](http://www.opportunacadentem.org/certum): conataque artes latos!\n\n- Alter sua\n- Amentis clamor\n- Suspirat albentibus delusa barbariam Gigantas umbras at\n- Vertit iuventus\n- Ergo conspexi aratri infausto audacia esset\n\n## Rebus in parantem dignum ruptosque collis certamine\n\nNon Creten mirabere concrescere ipse virgineos quos et mensis iunget, nullamque\nLibycas. Uterum monimenta nunc obliquo fiant **illa** ante haeremusque opesque\nOthrys, rursusque indoctum ignibus **comites Iri**. Sermonibus ripa flectant\npudibundaque ardet est medioque nobilis, heres me genetrix videritis illa. Humo\ndum ac accepit mando imagine similis, ingemuit ora omnes offensa omnia causa\nuberibus fertque aequora?\n\nFrustra fecit pan! Unum deosque membra: nova: inter sic genitor terra somni\nAeoliden quam telae. Haec gravis non facies lata mille, procorum possem scopulo,\nsibi sic maius iussa; ante caelestum ungues, opem. Ramis sanguine, si *nec\nmiseris scitatur* pereuntem comites, vult et cani cur ventorum, tuebere\ntenuaverat, multi.\n\nNeque gemitu. Quo moles ex quis certa adhaesit hanc saltu nigrae [adeundi\ncarinae](http://vultus-antiquas.io/) vobis murmure haberet ira factis? Et\n**adiere** inplevere sibi, retia.",
			publishedAt: "2018-12-14T21:09:00.000Z",
			author: Author(
				id: "2cab326a-ab2f-4624-a6d7-2e1855fc5e4e",
				name: "Mel Herbert"
			)
		)
	]

    static let fallbackData = """
    [
    	{
    		"id": "2f1fe9c0-bdbf-4104-bee2-3c0ec514436f",
    		"title": "About EM:RAP",
    		"hlsURL": "https://d140vvwqovffrf.cloudfront.net/media/5e852de33c8e4/hls/index.m3u8",
    		"fullURL": "https://d140vvwqovffrf.cloudfront.net/media/5e852de33c8e4/full/720.mp4",
    		"description": "# Omnibus quae\\n\\n## Sit sed inque teneris\\n\\nLorem markdownum adhuc securosque, suo ponto satae se adhuc, terga. Fuit campus,\\nqui, quod **formasque coeunt artus**, certamina nurus nunc coniuge peregit ritu.\\nSuperat funera perque ferrem corpora saevam caespite nam maternaque sumpserat.\\n\\nIuga adest? Humano percussit Haemum frugis, vix qua quae iniustaque et tibi,\\ntenuisset vix lacrimis umbra, ire. Ante nec. Est deam vivum ad ponti, non\\ncaelamina et Sisyphon, inhonestaque atque, sed et vivit.\\n\\n1. Litora gloria Hyperionis carmina ungulaque patiere\\n2. Dari nasci\\n3. Fragilesque tendo dixit resonant quoque\\n4. Et segnibus fuge ter Armeniae templi\\n5. Sit deponere credit non aquarum Achilles tenus\\n6. Exsultat artes Iovi\\n\\nStupet honoris. Nunc angebar Dryasque.\\n\\n## Multamque siqua hospitibus patrio\\n\\nExstimulata blando; qui armis Ixion **finire laetusque** sororem, aut **et**,\\nigne membra? Nec bello ramis pari, Libye percensuit metallis, *in* mediis\\nprocumbere.\\n\\n- Et illa\\n- Clanis sceleris\\n- Velletque prolisque auditum\\n- Res delius iraque Semeles veluti\\n- Cava umor quid superest fama artus\\n\\nTutam auditurum ab erit sum frigore in fleturi vectus eodem *quinos capillos me*\\nagros. Ut rogis **foret cogor** neve ultoris rabiem, pro perque meque ossa\\n[alter fassusque](http://www.querellissacra.com/reminiscitur) proxima erigitur,\\nest *occulte concutio*. Celsa Echo huc credunt natus leones racemifero condi\\nPhlegyanque esse; suis, per. Versum fessam me reponit omnis demisere litore\\ncorpora esse expers veteris Noctisque.\\n\\n1. Inhaerebat undas ungula pulsat subiit modo\\n2. Madefacta Cyanen\\n3. Qua ex Tartessia nulla dixi illum lumina\\n4. Et et viridi serpens ast longoque agros\\n5. Aras nos arma medium consonat cum desit\\n6. Facta ille ego\\n\\nFibris animo. Tui nota quod iter caeli mirata pede paulatim purpureum tergo\\nseptemplicis? Progenies ait. Patrios sis est exclamat exiguo Myrrha in tibi\\nexarsit cum. Flagrantemque cape: iter capacem cum rerum quota pennisque pone non\\npatria.",
    		"publishedAt": "2018-12-14T21:09:00.000Z",
    		"author": {
    			"id": "2cab326a-ab2f-4624-a6d7-2e1855fc5e4e",
    			"name": "Mel Herbert"
    		}
    	},
    	{
    		"id": "6ec246b1-ad09-4e03-8573-21e2e779856c",
    		"title": "EM:RAP Global Outreach",
    		"hlsURL": "https://d140vvwqovffrf.cloudfront.net/media/5e87b9a811599/hls/index.m3u8",
    		"fullURL": "https://d140vvwqovffrf.cloudfront.net/media/5e87b9a811599/full/720.mp4",
    		"description": "# Famemque horrescere occasus neve\\n\\n## Ityosque oraque subvolat patetis\\n\\nLorem markdownum purpura Scyrum, ira aper cruribus purpurea at neve\\npraecordiaque illa de erat. Lapithae pollice; nec *aret principiis* sua preces\\nregia nam? Templa cruorem sparsos **ardua** protinus *subtraheret fruge*\\nexemplum, esse, toros. Ubi quibus sparsaque tutela.\\n\\n- Suo rogat lumina puto ut frater Lycetum\\n- Illos dilecta diva\\n- Quoniam Daedalus\\n- Vulnere coniuge trisulcis nunc leves\\n- Una veluti mea Achivi ferum pectus\\n- Pressit tu Iovis mutantur sedere Credulitas ambage\\n\\n*Vitataque Fame cornibus* volubilitas ad nec insania petito adrectisque ipsa\\nanimasque pugnabant ferrum parant. Sensit haec promissaque currus. Tauri levius\\ntetigisset dixere est mora ponti, ea posuit pedem circuit: viribus, iterum, e\\nseque! Temptare perpetuo ferit non telis Hippotaden milibus valuissent\\n[ait](http://incensaquefaveas.com/aera), corpore volenti instruxere Anienis\\namor, bis saxum?\\n\\n## Regemque miscuit capit amanti\\n\\nTalibus haustus, nec ficti: ille una lacertis praeter dixerat inputet.\\n[Instabiles illam](http://cerniset.net/sacraangustis), suique [mentitus manus\\nserpente](http://www.opportunacadentem.org/certum): conataque artes latos!\\n\\n- Alter sua\\n- Amentis clamor\\n- Suspirat albentibus delusa barbariam Gigantas umbras at\\n- Vertit iuventus\\n- Ergo conspexi aratri infausto audacia esset\\n\\n## Rebus in parantem dignum ruptosque collis certamine\\n\\nNon Creten mirabere concrescere ipse virgineos quos et mensis iunget, nullamque\\nLibycas. Uterum monimenta nunc obliquo fiant **illa** ante haeremusque opesque\\nOthrys, rursusque indoctum ignibus **comites Iri**. Sermonibus ripa flectant\\npudibundaque ardet est medioque nobilis, heres me genetrix videritis illa. Humo\\ndum ac accepit mando imagine similis, ingemuit ora omnes offensa omnia causa\\nuberibus fertque aequora?\\n\\nFrustra fecit pan! Unum deosque membra: nova: inter sic genitor terra somni\\nAeoliden quam telae. Haec gravis non facies lata mille, procorum possem scopulo,\\nsibi sic maius iussa; ante caelestum ungues, opem. Ramis sanguine, si *nec\\nmiseris scitatur* pereuntem comites, vult et cani cur ventorum, tuebere\\ntenuaverat, multi.\\n\\nNeque gemitu. Quo moles ex quis certa adhaesit hanc saltu nigrae [adeundi\\ncarinae](http://vultus-antiquas.io/) vobis murmure haberet ira factis? Et\\n**adiere** inplevere sibi, retia.",
    		"publishedAt": "2019-12-15T22:17:00.000Z",
    		"author": {
    			"id": "2cab326a-ab2f-4624-a6d7-2e1855fc5e4e",
    			"name": "Mel Herbert"
    		}
    	}
    ]
    """.data(using: .utf8)!
}
