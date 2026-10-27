//
//  ItinerarioMock.swift
//  UGo
//
//  Created by s11 on 28/10/25.
//

import Foundation

extension Itinerario {
    static let esempio = Itinerario(
        Coordinate_E_lat: "45.8721",
        Coordinate_E_lon: "9.6721",
        Coordinate_S_lat: "45.8654",
        Coordinate_S_lon: "9.6812",
        ID: 1,
        difficolta: "Media",
        regione: "Trentino-Alto Adige",
        tag: "Natura",
        tappe_itinerario: [
            "Partenza: Rifugio Lago Verde",
            "Tappa 1: Cascata Grande",
            "Tappa 2: Belvedere Panoramico",
            "Arrivo: Rifugio Lago Rosso"
        ],
        descrizione: """
        Un bellissimo itinerario immerso nella natura, con sentieri panoramici,
        boschi rigogliosi e cascate spettacolari. Ideale per escursioni di mezza giornata.
        """,
        distanza_km: "8 km",
        durata_ore: "3h 30m",
        nome: "Sentiero delle Cascate",
        URL_immagine: "https://picsum.photos/600/400"
    )
}

// MARK: - Screenshot mode
// Only used by the screenshot workflow (.github/workflows/screenshots.yml), which launches the app
// with "-mock-data" and "-screen <name>". A normal launch ignores both arguments.

enum ScreenshotMode {
    static var useMock: Bool {
        ProcessInfo.processInfo.arguments.contains("-mock-data")
    }

    static var screen: String? {
        let args = ProcessInfo.processInfo.arguments
        guard let i = args.firstIndex(of: "-screen"), i + 1 < args.count else { return nil }
        return args[i + 1]
    }
}

extension Tags {
    static let esempi: [Tags] = [
        Tags(id: "tag1", ID: 1, nome_tag: "Natura"),
        Tags(id: "tag2", ID: 2, nome_tag: "Costa"),
        Tags(id: "tag3", ID: 3, nome_tag: "Panoramico"),
        Tags(id: "tag4", ID: 4, nome_tag: "Cultura")
    ]
}

extension Itinerario {
    static let esempi: [Itinerario] = [
        esempio,
        Itinerario(
            id: "it2",
            Coordinate_E_lat: "44.1349",
            Coordinate_E_lon: "9.6840",
            Coordinate_S_lat: "44.1456",
            Coordinate_S_lon: "9.6540",
            ID: 2,
            difficolta: "Facile",
            regione: "Liguria",
            tag: "Costa",
            tappe_itinerario: [
                "Partenza: Monterosso al Mare",
                "Tappa 1: Punta Mesco",
                "Arrivo: Vernazza"
            ],
            descrizione: "Un tratto del Sentiero Azzurro tra terrazze di vigneti e mare aperto, con vista sui borghi delle Cinque Terre.",
            distanza_km: "3.5 km",
            durata_ore: "1h 30m",
            nome: "Sentiero Azzurro",
            URL_immagine: "https://picsum.photos/seed/ugo2/600/400"
        ),
        Itinerario(
            id: "it3",
            Coordinate_E_lat: "40.6139",
            Coordinate_E_lon: "14.5576",
            Coordinate_S_lat: "40.6256",
            Coordinate_S_lon: "14.5440",
            ID: 3,
            difficolta: "Media",
            regione: "Campania",
            tag: "Panoramico",
            tappe_itinerario: [
                "Partenza: Bomerano",
                "Tappa 1: Grotta del Biscotto",
                "Arrivo: Nocelle"
            ],
            descrizione: "Un percorso a picco sulla Costiera Amalfitana, con panorami sul golfo di Positano e su Capri.",
            distanza_km: "7.8 km",
            durata_ore: "3h",
            nome: "Sentiero degli Dei",
            URL_immagine: "https://picsum.photos/seed/ugo3/600/400"
        ),
        Itinerario(
            id: "it4",
            Coordinate_E_lat: "46.6944",
            Coordinate_E_lon: "12.0861",
            Coordinate_S_lat: "46.6942",
            Coordinate_S_lon: "12.0858",
            ID: 4,
            difficolta: "Facile",
            regione: "Trentino-Alto Adige",
            tag: "Natura",
            tappe_itinerario: [
                "Partenza: Hotel Lago di Braies",
                "Tappa 1: Riva ovest",
                "Arrivo: Hotel Lago di Braies"
            ],
            descrizione: "Un anello intorno al lago, circondato dalle pareti dolomitiche, adatto a tutta la famiglia.",
            distanza_km: "3.5 km",
            durata_ore: "1h 15m",
            nome: "Anello del Lago di Braies",
            URL_immagine: "https://picsum.photos/seed/ugo4/600/400"
        ),
        Itinerario(
            id: "it5",
            Coordinate_E_lat: "43.7696",
            Coordinate_E_lon: "11.2558",
            Coordinate_S_lat: "43.7731",
            Coordinate_S_lon: "11.2557",
            ID: 5,
            difficolta: "Facile",
            regione: "Toscana",
            tag: "Cultura",
            tappe_itinerario: [
                "Partenza: Ponte Vecchio",
                "Tappa 1: Palazzo Pitti",
                "Arrivo: Piazzale Michelangelo"
            ],
            descrizione: "Una passeggiata tra i luoghi simbolo di Firenze, dal centro storico fino alla terrazza panoramica.",
            distanza_km: "4 km",
            durata_ore: "1h 45m",
            nome: "Firenze da Ponte Vecchio",
            URL_immagine: "https://picsum.photos/seed/ugo5/600/400"
        )
    ]
}
