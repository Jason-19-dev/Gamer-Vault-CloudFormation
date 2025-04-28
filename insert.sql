-- Insertar videojuegos
INSERT INTO
    products (
        product_id,
        prod_name,
        prod_description,
        prod_price,
        created_at,
        image_url,
        category_id
    )
VALUES (
        UUID(),
        'Cyberpunk 2077',
        '{"genre": "RPG", "developer": "CD Projekt Red", "release_year": 2020, "platforms": ["PC", "PS5", "Xbox Series X"]}',
        49.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Cyberpunk_2077_box_art.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'The Witcher 3: Wild Hunt',
        '{"genre": "RPG", "developer": "CD Projekt Red", "release_year": 2015, "platforms": ["PC", "PS4", "Xbox One", "Switch"]}',
        39.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Witcher_3_cover_art.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'Red Dead Redemption II',
        '{"genre": "Action-Adventure", "developer": "Rockstar Games", "release_year": 2018, "platforms": ["PC", "PS4", "Xbox One"]}',
        59.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Red_Dead_Redemption_II.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'Grand Theft Auto V',
        '{"genre": "Action-Adventure", "developer": "Rockstar Games", "release_year": 2013, "platforms": ["PC", "PS5", "Xbox Series X"]}',
        29.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Grand_Theft_Auto_V.png',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'Call of Duty: Modern Warfare',
        '{"genre": "FPS", "developer": "Infinity Ward", "release_year": 2019, "platforms": ["PC", "PS4", "Xbox One"]}',
        59.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Call_of_Duty.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'The Legend of Zelda: Breath of the Wild',
        '{"genre": "Action-Adventure", "developer": "Nintendo", "release_year": 2017, "platforms": ["Switch"]}',
        59.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/The_Legend_of_Zelda.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'Fortnite',
        '{"genre": "Battle Royale", "developer": "Epic Games", "release_year": 2017, "platforms": ["PC", "PS5", "Xbox Series X", "Mobile"], "free_to_play": true}',
        0.00,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Fortnite.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'Minecraft',
        '{"genre": "Sandbox", "developer": "Mojang", "release_year": 2011, "platforms": ["PC", "PS4", "Xbox One", "Switch", "Mobile"]}',
        26.95,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Minecraft.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'FIFA 23',
        '{"genre": "Sports", "developer": "EA Sports", "release_year": 2022, "platforms": ["PC", "PS5", "Xbox Series X"]}',
        59.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/FIFA_23.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'Apex Legends',
        '{"genre": "Battle Royale", "developer": "Respawn Entertainment", "release_year": 2019, "platforms": ["PC", "PS5", "Xbox Series X"], "free_to_play": true}',
        0.00,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Apex_Legends.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    );

INSERT INTO
    products (
        product_id,
        prod_name,
        prod_description,
        prod_price,
        created_at,
        image_url,
        category_id
    )
VALUES (
        UUID(),
        'Roblox',
        '{"genre": "Sandbox", "developer": "Roblox Corporation", "release_year": 2006, "platforms": ["PC", "Xbox One", "Mobile"], "free_to_play": true}',
        0.00,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/videogames/Roblox.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'Valorant',
        '{"genre": "Tactical Shooter", "developer": "Riot Games", "release_year": 2020, "platforms": ["PC"], "free_to_play": true}',
        0.00,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/videogames/Valorant.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'League of Legends',
        '{"genre": "MOBA", "developer": "Riot Games", "release_year": 2009, "platforms": ["PC"], "free_to_play": true}',
        0.00,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/videogames/League_of_Legends.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    ),
    (
        UUID(),
        'World of Warcraft',
        '{"genre": "MMORPG", "developer": "Blizzard Entertainment", "release_year": 2004, "platforms": ["PC"], "free_to_play": false}',
        19.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/videogames/World_of_Warcraft.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'videogame'
        )
    );

/* coind */

-- Insertar paquetes de monedas para juegos
INSERT INTO
    products (
        product_id,
        prod_name,
        prod_description,
        prod_price,
        created_at,
        image_url,
        category_id
    )
VALUES (
        UUID(),
        'Fortnite V-Bucks 1000',
        '{"game": "Fortnite", "currency": "V-Bucks", "platforms": ["PC", "PS5", "Xbox Series X", "Mobile"], "delivery": "instant"}',
        9.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Fortnite_VBucks.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'coin'
        )
    ),
    (
        UUID(),
        'GTA Online Shark Card ($1M)',
        '{"game": "Grand Theft Auto V", "currency": "GTA$", "platforms": ["PC", "PS5", "Xbox Series X"], "delivery": "24h"}',
        19.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/GTA_Shark_Card.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'coin'
        )
    ),
    (
        UUID(),
        'Apex Legends Coins 1000',
        '{"game": "Apex Legends", "currency": "Apex Coins", "platforms": ["PC", "PS5", "Xbox Series X"], "delivery": "instant"}',
        9.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Apex_Coins.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'coin'
        )
    ),
    (
        UUID(),
        'Call of Duty Points 2400',
        '{"game": "Call of Duty", "currency": "COD Points", "platforms": ["PC", "PS5", "Xbox Series X"], "delivery": "instant"}',
        19.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/COD_Points.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'coin'
        )
    ),
    (
        UUID(),
        'FIFA 23 Ultimate Points 1600',
        '{"game": "FIFA 23", "currency": "FIFA Points", "platforms": ["PC", "PS5", "Xbox Series X"], "delivery": "instant"}',
        19.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/FIFA_Points.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'coin'
        )
    ),
    (
        UUID(),
        'Minecraft Coins 5000',
        '{"game": "Minecraft", "currency": "Minecoins", "platforms": ["PC", "Mobile"], "delivery": "instant"}',
        9.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Minecoins.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'coin'
        )
    ),
    (
        UUID(),
        'Robux 800',
        '{"game": "Roblox", "currency": "Robux", "platforms": ["PC", "Mobile"], "delivery": "instant"}',
        9.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Robux.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'coin'
        )
    ),
    (
        UUID(),
        'Valorant Points 1000',
        '{"game": "Valorant", "currency": "VP", "platforms": ["PC"], "delivery": "instant"}',
        9.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/Valorant_Points.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'coin'
        )
    ),
    (
        UUID(),
        'World of Warcraft Token',
        '{"game": "World of Warcraft", "currency": "WoW Token", "platforms": ["PC"], "delivery": "instant", "game_time": "30 days"}',
        19.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/WoW_Token.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'coin'
        )
    ),
    (
        UUID(),
        'League of Legends RP 1380',
        '{"game": "League of Legends", "currency": "Riot Points", "platforms": ["PC"], "delivery": "instant"}',
        9.99,
        CURRENT_TIMESTAMP,
        'https://d1th0hc7ymkxpv.cloudfront.net/LoL_RP.jpg',
        (
            SELECT category_id
            FROM categories
            WHERE
                name = 'coin'
        )
    );