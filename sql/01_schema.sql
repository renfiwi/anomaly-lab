DROP TABLE IF EXISTS raw_network CASCADE;

CREATE TABLE raw_network (
	idx integer primary key,
	ts timestamp NOT NULL,
	throughput float8,
	congestion float8,
	packet_loss float8,
	latency float8,
	jitter float8,
	routers text,
	network_target text,
	anomaly_throughput smallint,
	anomaly_congestion smallint,
	anomaly_packet_loss smallint,
	anomaly_latency smallint,
	anomaly_jitter smallint
);

COPY raw_network FROM '/data/data_for_db.csv' WITH (FORMAT csv, HEADER true);
CREATE INDEX raw_network_ts_idx ON raw_network (ts);
