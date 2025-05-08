-- public.roles definition

-- Drop table

-- DROP TABLE public.roles;

CREATE TABLE public.roles (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT roles_name_key UNIQUE (name),
	CONSTRAINT roles_pkey PRIMARY KEY (id)
);


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	id serial4 NOT NULL,
	username varchar NULL,
	email varchar NULL,
	"password" varchar NULL,
	is_active bool NULL,
	role_id int4 NULL,
	created_at timestamp NULL,
	subscription_plan public."subscriptionplan" NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id),
	CONSTRAINT users_username_key UNIQUE (username),
	CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id)
);
CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);


-- public.feedback_pages definition

-- Drop table

-- DROP TABLE public.feedback_pages;

CREATE TABLE public.feedback_pages (
	id serial4 NOT NULL,
	url_token varchar NOT NULL,
	title varchar NOT NULL,
	description varchar NULL,
	expires_at timestamp NULL,
	user_id int4 NOT NULL,
	CONSTRAINT feedback_pages_pkey PRIMARY KEY (id),
	CONSTRAINT feedback_pages_url_token_key UNIQUE (url_token),
	CONSTRAINT feedback_pages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id)
);
CREATE INDEX ix_feedback_pages_id ON public.feedback_pages USING btree (id);


-- public.preview_pages definition

-- Drop table

-- DROP TABLE public.preview_pages;

CREATE TABLE public.preview_pages (
	id serial4 NOT NULL,
	title varchar NULL,
	description varchar NULL,
	url_token varchar NULL,
	expires_at timestamp NULL,
	logo_url varchar NULL,
	gradient varchar NULL,
	font varchar NULL,
	user_id int4 NOT NULL,
	background_color varchar NULL,
	feedback_page_id int4 NULL,
	CONSTRAINT preview_pages_pkey PRIMARY KEY (id),
	CONSTRAINT preview_pages_feedback_page_id_fkey FOREIGN KEY (feedback_page_id) REFERENCES public.feedback_pages(id),
	CONSTRAINT preview_pages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id)
);
CREATE INDEX ix_preview_pages_id ON public.preview_pages USING btree (id);
CREATE INDEX ix_preview_pages_title ON public.preview_pages USING btree (title);
CREATE UNIQUE INDEX ix_preview_pages_url_token ON public.preview_pages USING btree (url_token);


-- public.feedbacks definition

-- Drop table

-- DROP TABLE public.feedbacks;

CREATE TABLE public.feedbacks (
	id serial4 NOT NULL,
	"content" varchar NOT NULL,
	feedback_type public."feedbacktype" NOT NULL,
	created_at timestamp NULL,
	feedback_page_id int4 NOT NULL,
	customer_email varchar NULL,
	CONSTRAINT feedbacks_pkey PRIMARY KEY (id),
	CONSTRAINT feedbacks_feedback_page_id_fkey FOREIGN KEY (feedback_page_id) REFERENCES public.feedback_pages(id)
);
CREATE INDEX ix_feedbacks_id ON public.feedbacks USING btree (id);