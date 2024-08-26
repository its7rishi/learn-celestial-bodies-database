--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    radius integer NOT NULL,
    mass numeric NOT NULL,
    has_minerals boolean DEFAULT false,
    is_threat boolean DEFAULT false,
    galaxy_id integer,
    asteroid_code text NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    radius integer NOT NULL,
    mass numeric NOT NULL,
    has_life boolean DEFAULT false,
    has_water boolean DEFAULT false,
    galaxy_code text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    radius integer NOT NULL,
    mass numeric NOT NULL,
    has_life boolean DEFAULT false,
    has_water boolean DEFAULT false,
    planet_id integer,
    moon_code text NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    radius integer NOT NULL,
    has_life boolean DEFAULT false,
    has_water boolean DEFAULT false,
    star_id integer,
    planet_code text NOT NULL,
    mass numeric NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    radius integer NOT NULL,
    mass numeric NOT NULL,
    is_round boolean DEFAULT true,
    is_dying boolean DEFAULT false,
    galaxy_id integer,
    star_code text NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Aster1', 'Aster1', 23, 234, 34.56, true, false, 1, 'AS1');
INSERT INTO public.asteroid VALUES (2, 'Aster2', 'Aster2', 234, 534, 94.56, true, false, 1, 'AS2');
INSERT INTO public.asteroid VALUES (3, 'Aster3', 'Aster3', 323, 234, 324.56, true, false, 1, 'AS3');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', 'Milkyway galaxy', 7999, 4567, 5679.23, true, true, 'MK');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda galaxy', 6732, 8963, 3242.33, false, false, 'AM');
INSERT INTO public.galaxy VALUES (3, 'Pinwheel', 'Pinwheel galaxy', 7599, 2267, 4479.23, false, false, 'PW');
INSERT INTO public.galaxy VALUES (4, 'Black Eye', 'Black Eye galaxy', 6732, 8963, 3242.33, false, false, 'BE');
INSERT INTO public.galaxy VALUES (5, 'Tadpole', 'Tadpole galaxy', 4932, 3963, 9942.33, false, false, 'TP');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Whirlpool galaxy', 2332, 1163, 442.33, false, false, 'WP');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth moon', 342, 345, 456.7, false, false, 3, 'MN');
INSERT INTO public.moon VALUES (2, 'Phobos', 'Phobos moon', 231, 783, 32.49, false, false, 4, 'PH');
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos moon', 123, 456, 78.90, false, false, 4, 'DE');
INSERT INTO public.moon VALUES (4, 'Europa', 'Europa moon', 872, 241, 892.22, false, false, 5, 'EU');
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Ganymede moon', 842, 398, 982.3, false, false, 5, 'GN');
INSERT INTO public.moon VALUES (6, 'Callisto', 'Callisto moon', 432, 782, 345.33, false, false, 5, 'CO');
INSERT INTO public.moon VALUES (7, 'Kallichore', 'Kallichore moon', 823, 231, 823.23, false, false, 5, 'KL');
INSERT INTO public.moon VALUES (8, 'Amathela', 'Amathela moon', 823, 231, 823.23, false, false, 5, 'AM');
INSERT INTO public.moon VALUES (9, 'Adrastia', 'Adrastia moon', 823, 231, 823.23, false, false, 5, 'AR');
INSERT INTO public.moon VALUES (10, 'Lysithea', 'Ltsithea moon', 823, 231, 823.23, false, false, 5, 'LY');
INSERT INTO public.moon VALUES (11, 'Carme', 'Carme moon', 823, 231, 823.23, false, false, 5, 'CAR');
INSERT INTO public.moon VALUES (12, 'Elara', 'Elara moon', 823, 231, 823.23, false, false, 5, 'ELR');
INSERT INTO public.moon VALUES (13, 'Titan', 'Titan moon', 421, 246, 134.33, false, false, 6, 'TI');
INSERT INTO public.moon VALUES (14, 'Mimas', 'Mimas moon', 421, 246, 134.33, false, false, 6, 'MIM');
INSERT INTO public.moon VALUES (15, 'Hyperion', 'Hyperion moon', 421, 246, 134.33, false, false, 6, 'HY');
INSERT INTO public.moon VALUES (16, 'Dion', 'Dion moon', 234, 543, 321.32, false, false, 6, 'DIO');
INSERT INTO public.moon VALUES (17, 'Ariel', 'Ariel moon', 232, 421, 532.32, false, false, 7, 'ARI');
INSERT INTO public.moon VALUES (18, 'Puck', 'Puck moon', 421, 246, 134.33, false, false, 6, 'PUC');
INSERT INTO public.moon VALUES (19, 'Bianca', 'Bianca moon', 421, 246, 134.33, false, false, 6, 'BI');
INSERT INTO public.moon VALUES (20, 'Trinculo', 'Trinculo moon', 421, 246, 134.33, false, false, 6, 'TRI');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Planet Mercury', 532, 572, false, false, 1, 'MER', 34.55);
INSERT INTO public.planet VALUES (2, 'Venus', 'Planet Venus', 582, 982, false, false, 1, 'VEN', 84.55);
INSERT INTO public.planet VALUES (3, 'Earth', 'Planet Earth', 432, 5472, true, true, 1, 'EAR', 34.55);
INSERT INTO public.planet VALUES (4, 'Mars', 'Planet Mars', 1532, 2572, false, false, 1, 'MAR', 134.55);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Planet Jupiter', 23532, 22572, false, false, 1, 'JUP', 2134.55);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Planet Saturn', 532, 872, false, false, 1, 'SAT', 94.55);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Planet Uranus', 632, 172, false, false, 1, 'URA', 74985);
INSERT INTO public.planet VALUES (8, 'Nepture', 'Planet Neptune', 232, 772, false, false, 1, 'NEP', 24.55);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Planet Pluto', 432, 72, false, false, 1, 'PLU', 54.55);
INSERT INTO public.planet VALUES (10, 'Zorro', 'Planet Zorro', 522, 582, false, false, 2, 'ZOR', 348.55);
INSERT INTO public.planet VALUES (11, 'Rocky', 'Planet Rocky', 5332, 5732, false, false, 2, 'ROC', 384.55);
INSERT INTO public.planet VALUES (12, 'Wolf', 'Planet Wolf', 5342, 5722, false, false, 3, 'WOL', 334.55);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Sun star', 4212, 3872, 482.33, true, false, 1, 'SUN');
INSERT INTO public.star VALUES (2, 'Arctus', 'Arctus star', 5212, 3572, 1482.33, true, false, 1, 'ARC');
INSERT INTO public.star VALUES (3, 'Sirius', 'Sirius star', 4212, 7872, 492.33, true, false, 1, 'SIR');
INSERT INTO public.star VALUES (4, 'Canopus', 'Canopus star', 1112, 3272, 4882.33, true, false, 1, 'CAN');
INSERT INTO public.star VALUES (5, 'Rigel', 'Rigel star', 5212, 3572, 1482.33, true, false, 1, 'RIG');
INSERT INTO public.star VALUES (6, 'Antares', 'Antares star', 4512, 2872, 892.33, true, false, 1, 'ANT');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

