//
//  ItinerarioMock.swift
//  UGo
//
//  Created by s11 on 28/10/25.
//

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
