\connect player_db;

DROP table if exists public.player;

CREATE TABLE public.player (
	id serial4 NOT NULL,
	nickname varchar(45) NOT NULL,
	"password" varchar(45) NOT NULL,
	"level" int4 NOT NULL DEFAULT 1,
	"exp" int4 NOT NULL DEFAULT 0,
	gold int4 NOT NULL DEFAULT 0,
	stamina int4 NOT NULL DEFAULT 0,
	stage_id int4 NOT NULL,
	character_id int4 NOT NULL,
	is_deleted bool NOT NULL DEFAULT false,
	create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	update_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT player_nickname_key UNIQUE (nickname),
	CONSTRAINT player_pkey PRIMARY KEY (id)
);

\connect inventory_db;

DROP table if exists public.inventory;

CREATE TABLE public.inventory (
	id serial4 NOT NULL,
	player_id int4 NOT NULL,
	item_id int4 NOT NULL,
	quantity int4 NOT NULL DEFAULT 1,
	is_equipped bool NOT NULL DEFAULT false,
	slot_position int4 NOT NULL,
	create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	update_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT inventory_pkey PRIMARY KEY (id)
);

\connect item_db;

DROP table if exists public.item;

CREATE TABLE public.item (
	id serial4 NOT NULL,
	"name" varchar(45) NOT NULL,
	description varchar(100) NULL,
	item_type varchar(10) NOT NULL,
	item_hp int4 NOT NULL DEFAULT 0,
	item_attack int4 NOT NULL DEFAULT 0,
	item_defense int4 NOT NULL DEFAULT 0,
	create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	update_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT item_item_type_check CHECK (((item_type)::text = ANY ((ARRAY['weapon'::character varying, 'armor'::character varying, 'etc'::character varying])::text[]))),
	CONSTRAINT item_pkey PRIMARY KEY (id)
);

\connect stage_db;

DROP table if exists public.stage;

CREATE TABLE public.stage (
	id serial4 NOT NULL,
	"name" varchar(100) NOT NULL,
	exp_reward int4 NOT NULL,
	gold_reward int4 NOT NULL,
	CONSTRAINT stage_pkey PRIMARY KEY (id)
);

\connect battle_db;

DROP table if exists public.wave;

CREATE TABLE public.wave (
	id serial4 NOT NULL,
	stage_id int4 NOT NULL,
	wave_number int4 NOT NULL,
	total_monsters int4 NOT NULL,
	CONSTRAINT wave_pkey PRIMARY KEY (id)
);

DROP table if exists public.wave_monster;

CREATE TABLE public.wave_monster (
	id serial4 NOT NULL,
	wave_id int4 NOT NULL,
	monster_id int4 NOT NULL,
	quantity int4 NOT NULL,
	CONSTRAINT wave_monster_pkey PRIMARY KEY (id)
);

\connect monster_db;

DROP table if exists public.monster;

CREATE TABLE public.monster (
	id serial4 NOT NULL,
	"name" varchar(45) NOT NULL,
	description varchar(100) NULL,
	monster_type varchar(10) NOT NULL,
	monster_hp int4 NOT NULL,
	monster_attack int4 NOT NULL,
	monster_defense int4 NOT NULL,
	exp_reward int4 NOT NULL,
	create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	update_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT monster_monster_type_check CHECK (((monster_type)::text = ANY ((ARRAY['boss'::character varying, 'minion'::character varying, 'elite'::character varying])::text[]))),
	CONSTRAINT monster_pkey PRIMARY KEY (id)
);

\connect character_db;

DROP table if exists public."character";

CREATE TABLE public."character" (
	id serial4 NOT NULL,
	"name" varchar(45) NOT NULL,
	description varchar(100) NULL,
	character_hp int4 NOT NULL,
	character_attack int4 NOT NULL,
	character_defense int4 NOT NULL,
	create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	update_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT character_pkey PRIMARY KEY (id)
);
