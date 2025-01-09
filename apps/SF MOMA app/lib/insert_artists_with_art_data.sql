INSERT INTO artists_with_art (constituent_id, name)
VALUES (4432, 'Linda Woo3')
ON CONFLICT (constituent_id) DO NOTHING;