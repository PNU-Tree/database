\connect player_db;

DROP table if exists public.player;

CREATE TABLE public.player (
	id serial4 NOT NULL,
	nickname varchar(45) NOT NULL,
	"password" varchar(100) NOT NULL,
	is_deleted bool NOT NULL DEFAULT false,
	create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	update_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	roles _varchar NULL DEFAULT '{GUEST}'::character varying[],
	CONSTRAINT player_nickname_key UNIQUE (nickname),
	CONSTRAINT player_pkey PRIMARY KEY (id)
);

\connect ranking_db;

DROP table if exists public.ranking;

CREATE TABLE public.ranking (
	id serial4 NOT NULL,
	max_score int4 NOT NULL,
	rank_number int4 NOT NULL,
	player_id int4 NOT NULL,
	is_deleted bool NOT NULL DEFAULT false,
	create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	update_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT ranking_pkey PRIMARY KEY (id)
);
