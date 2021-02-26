function removeEmpty(obj) {
    Object.keys(obj).forEach((key) => {
        if (obj[key] && typeof obj[key] === 'object') {
            const childObject = removeEmpty(obj[key]);
            if (childObject === undefined) {
                delete obj[key];
            }
        } else if (obj[key] === '' || obj[key] === null || obj[key] === undefined) {
            delete obj[key];
        }
    });
    return Object.keys(obj).length > 0 || obj instanceof Array ? obj : undefined;
};

let json = {
    "id": 3,
    "mois": "2017-07-01",
    "status": "Soumise",
    "ligneNoteDeFrais": {
        "2017-07-10": {
            "id": 1,
            "day": "2017-07-10",
            "fk": {
                "id": 2,
                "description": "frais kilomtrique",
                "nb": 5,
                "pu": 6,
                "totale": 44,
                "typeNoteDeFrais": null
            },
            "preuves": [],
            "detailFrais": {
                "12": {
                    "id": 1,
                    "description": "test",
                    "nb": 5,
                    "pu": 4,
                    "totale": 0,
                    "typeNoteDeFrais": {
                        "id": 12,
                        "intitule": "gg",
                        "justifiable": true,
                        "justificationObligatoire": true,
                        "quantifiable": true,
                        "new": false
                    }
                },
                "14": {},
                "15": {},
                "18": {},
                "19": {}
            }
        },
        "2017-07-01": {
            "fk": {},
            "detailFrais": {
                "12": {},
                "14": {},
                "15": {},
                "18": {},
                "19": {}
            }
        },
        "2017-07-02": {
            "fk": {},
            "detailFrais": {
                "12": {},
                "14": {},
                "15": {},
                "18": {},
                "19": {}
            }
        }
    }
}

//console.log(removeEmpty(json));

//https://stackoverflow.com/questions/45310279/removing-empty-entry-from-json-or-object
