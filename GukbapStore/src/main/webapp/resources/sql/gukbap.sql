CREATE TABLE IF NOT EXISTS gukbap(
	g_id VARCHAR(10) NOT NULL,
	g_name VARCHAR(20),
	g_price  INTEGER,
	g_description TEXT,
   	g_category VARCHAR(20),	
	g_orderQuantity INTEGER,
	g_reviewRating   INTEGER,
	g_reviewCount   INTEGER,
	g_fileName  VARCHAR(20),
	PRIMARY KEY (g_id)
)default CHARSET=utf8;

desc Gukbap;