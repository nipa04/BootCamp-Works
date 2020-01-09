--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: natalie
--

CREATE TABLE articles (
    id integer NOT NULL,
    author_id integer,
    title character varying(255),
    body text,
    date date
);


ALTER TABLE articles OWNER TO natalie;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: natalie
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_id_seq OWNER TO natalie;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: natalie
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: natalie
--

CREATE TABLE authors (
    id integer NOT NULL,
    name character varying(255),
    bio text
);


ALTER TABLE authors OWNER TO natalie;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: natalie
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authors_id_seq OWNER TO natalie;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: natalie
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: natalie
--

CREATE TABLE cities (
    id integer NOT NULL,
    name character varying(255),
    year_founded integer,
    province_id integer
);


ALTER TABLE cities OWNER TO natalie;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: natalie
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_id_seq OWNER TO natalie;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: natalie
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: natalie
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying(255),
    year_founded integer,
    national_animal character varying(255)
);


ALTER TABLE countries OWNER TO natalie;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: natalie
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO natalie;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: natalie
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: persons; Type: TABLE; Schema: public; Owner: natalie
--

CREATE TABLE persons (
    id integer NOT NULL,
    name character varying(255),
    age integer,
    residence_id integer
);


ALTER TABLE persons OWNER TO natalie;

--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: natalie
--

CREATE SEQUENCE persons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persons_id_seq OWNER TO natalie;

--
-- Name: persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: natalie
--

ALTER SEQUENCE persons_id_seq OWNED BY persons.id;


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: natalie
--

CREATE TABLE provinces (
    id integer NOT NULL,
    name character varying(255),
    year_founded integer,
    country_id integer
);


ALTER TABLE provinces OWNER TO natalie;

--
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: natalie
--

CREATE SEQUENCE provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE provinces_id_seq OWNER TO natalie;

--
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: natalie
--

ALTER SEQUENCE provinces_id_seq OWNED BY provinces.id;


--
-- Name: residences; Type: TABLE; Schema: public; Owner: natalie
--

CREATE TABLE residences (
    id integer NOT NULL,
    address character varying(255),
    year_built integer,
    city_id integer
);


ALTER TABLE residences OWNER TO natalie;

--
-- Name: residences_id_seq; Type: SEQUENCE; Schema: public; Owner: natalie
--

CREATE SEQUENCE residences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE residences_id_seq OWNER TO natalie;

--
-- Name: residences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: natalie
--

ALTER SEQUENCE residences_id_seq OWNED BY residences.id;


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: persons id; Type: DEFAULT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY persons ALTER COLUMN id SET DEFAULT nextval('persons_id_seq'::regclass);


--
-- Name: provinces id; Type: DEFAULT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY provinces ALTER COLUMN id SET DEFAULT nextval('provinces_id_seq'::regclass);


--
-- Name: residences id; Type: DEFAULT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY residences ALTER COLUMN id SET DEFAULT nextval('residences_id_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: natalie
--

COPY articles (id, author_id, title, body, date) FROM stdin;
1	2	I Can Text You A Pile of Poo, But I Can’t Write My Name	I am an engineer, and I am a writer. As an engineer, I spend a lot of time thinking about how text is stored, but relatively little about what information the text actually represents. To the computer, text is an abstract entity – a stream of 0s and 1s, and any semantic meaning is in the eye of the beholder. As a writer, of course, the meaning is everything, and the mechanics of how the text is stored is merely a technical detail.\\n\\nBut in an economy that is increasingly digital, increasingly global, and increasingly multilingual, we can no longer maintain this distinction. The information we want to represent is intimately linked to how it is stored. We can no longer separate the two.\\n\\nWhat is Unicode?\\n\\nWritten text is a sequence of graphemes – characters. Every character you type – whether letters like ‘a’ and ‘b’, punctuation marks like ‘?’, or even emoji like 💪👬👍 – has an ID number that computers use to store it. In order to communicate, computers need to agree on a common roster of how to assign these graphemes to numbers and vice versa. These rosters are known as character encodings. If you’ve ever stumbled across a website that looked readable, but certain characters were printed incorrectly (like “won’t” showing up as “wonâ€™t”), that’s because the computers were using slightly different encodings (in this case, UTF-8 and ISO-8859-1).\\n\\nUntil 2007, the most popular encoding was called ASCII. ASCII was first used in 1963, and later endorsed by President Lyndon B. Johnson. ASCII is formally known as US-ASCII, so it may come as no surprise that it focused exclusively on graphemes used in writing English. Today, the most common encoding on the Internet is UTF-8 (Unicode), which extends ASCII to support other languages.\\n\\nUnicode was first conceived in the late 80s by Lee Collins, Joe Becker, and Mark Davis, engineers at Apple and Xerox, as an attempt to create a universal character set for all text, not just English text. Together, they founded the Unicode Consortium, which determines the list of Unicode characters and has published 18 versions of the list since 1991.\\n\\nThe founders and current members of the Unicode Consortium are well-credentialed. Collins has an M.A. from Columbia University in East Asian languages and cultures. Becker’s biography notes that he “speaks survival-level Chinese, French, German, Japanese, and Russian, and has forgotten Latin.” (source)\\n\\nDespite this, we can’t ignore the composition of the Consortium’s members, directors, and officers, the people who define the everyday writing systems of all languages across the globe. They are comprised largely of white men (and a few white women) whose first language was either English or another European language.\\n\\nMany of them work for one of the nine organizations that hold full membership in the Consortium. Seven of these nine are US-based technology companies: Adobe, Apple, Google, IBM, Microsoft, Oracle, and Yahoo. One (SAP) is a German technology company. These companies have, by their very own admission, workforces that are overwhelmingly white, and leadership and tech teams that are even less represented by racial minorities. These reports lump Indians together under the broad umbrella “Asians”, so while it’s impossible to know exactly how badly various ethnic groups or native languages are actually represented, the data is far from encouraging.\\n\\nThe only other full member from the rest of the world is Oman’s Ministry of Endowment and Religious Affairs. Bizarrely, they are represented in the Consortium not by an Omani man, but by a Dutch man with only “professional working proficiency” in Arabic and a “full professional proficiency” in English, in addition to his native Dutch.\\n\\nSecond-Class Languages\\n\\nMy family’s native language, which I grew up speaking, is far from a niche language. Bengali is the seventh most common native language in the world, sitting ahead of the eighth (Russian) by a wide margin, with as many native speakers as French, German, and Italian combined.\\n\\nAnd yet, on the Internet, Bengali is very much a second-class citizen – as are Arabic (#5), Hindi (#4), and Mandarin (#1) – any language which is not written with the Latin alphabet.\\n\\nThe very first version of the Unicode standard did include Bengali. However, it left out a number of important characters. Until 2005, Unicode did not have one of the characters in the Bengali word for “suddenly”. Instead, people who wanted to write this everyday word had to combine three separate, unrelated characters. For English-speaking teenagers, combining characters in unexpected ways, like writing ‘w’ as ‘\\/\\/’, used to be a way of asserting technical literacy through “l33tspeak” – a shibboleth for nerds that derives its name from the word “elite”. But Bengalis were forced to make similar orthographic contortions just to write a simple email: ত + ্ + ‍ = ‍ৎ (the third character is the invisible “zero width joiner”).\\n\\nEven today, I am forced to do this when writing my own name. My name is not only a common Indian name, but one of the top 1,000 names in the United States as well. But the final letter has still not been given its own Unicode character, so I have to use a substitute.\\n\\nA few other characters that were more common historically, though still used today, were also missing for the first decade of Bengali’s existence in Unicode. It’s tempting to argue that historical characters have no place in a character set intended for computers. On the contrary, this makes their inclusion even more vital: rendering historical texts accurately is key to ensuring their survival in the transition to the age of digital media.\\n\\nFurthermore, these characters are still common enough that they were printed in the Bengali reading textbooks and workbooks that we used growing up. Omitting them literally ensures that existing materials for learning to read Bengali will not be universally accessible.\\n\\nWithout that argument, one might appeal to the limited space in the Unicode character set. Even if we take for granted the somewhat arbitrary maximum of 1,114,112 codepoints, the other alphabets included speak for themselves. The most recent update to the Unicode standard included the entire alphabet of Linear B, an ancient Mycenaean script that was not deciphered in the modern era until the 1950s. Nor does alleged scarcity explain the inclusion of Linear A, a Minoan script so arcane, scholars disagree on what language it even represented, let alone how to read the script.\\n\\nThe East Asian Problem\\n\\nI am not the only one who has trouble writing their name correctly in Unicode. Linguistically, East Asian languages such as Chinese, Japanese, and Korean have distinct writing systems. Some (but not all) of the characters trace their lineage back to a common set, but even these characters, known as Han characters, began to diverge and evolve independently over two thousand years ago.\\n\\nThe Unicode Consortium has launched a very controversial project known as Han Unification: an attempt to create a limited set of characters that will be shared by these so-called “CJK languages.” Instead of recognizing these languages as having their own writing systems that share some common ancestry, the Han unification process views them as mere variations on some “true” form.\\n\\nTo help English readers understand the absurdity of this premise, consider that the Latin alphabet (used by English) and the Cyrillic alphabet (used by Russian) are both derived from Greek. No native English speaker would ever think to try “Greco Unification” and consolidate the English, Russian, German, Swedish, Greek, and other European languages’ alphabets into a single alphabet. Even though many of the letters look similar to Latin characters used in English, nobody would try to use them interchangeably. ҭЋаt ωoulδ βε σutragєѳuѕ.\\n\\nEven though our language is exempt from this effort, Han unification is particularly troubling for Bengali speakers to hear about. The rhetoric is a blast from our own colonial past, when the British referred to Indian languages pejoratively as “dialects”. Depriving their colonial subjects of distinct linguistic identities was a key tactic in justifying their brutal rule over an “uncivilized” people.\\n\\nThis common sentiment is documented perfectly in My Fair Lady (based on George Bernard Shaw’s Pygmalion). Colonel Pickering proudly announces himself as ‘a student of Indian dialects’. Despite having just returned from studying Indian languages firsthand in India, Pickering has apparently failed to grasp the most basic of differences between India’s multitudinous languages. He proudly announces that there are ‘no fewer than 147 Indian dialects’ – a pathetically inaccurate count. (Today, India has 57 non-endangered and 172 endangered languages, each with multiple dialects – not even counting the many more that have died out in the century since My Fair Lady took place).\\n\\nAt the same time, Unicode embraces a new pictorial writing system: emoji. There are almost 1,000 emoji characters, such as ❤ (“Heavy black heart”), but also 🎼 (“Musical score”), and even 📠 (“Fax machine”). Each emoji gets its own Unicode codepoint. They are varied enough in meaning that they almost comprise their own language, as evidenced by the recent translation of Melville’s classic Moby Dick into Emoji.\\n\\nMaybe this isn’t so surprising; after all, various works of literature have already been translated into Klingon, an artificial language that only has three times as many words as emoji has characters. (Incidentally, in 2001 the Unicode Consortium rejected a 1997 proposal to include the Klingon alphabet known as pIqaD [sic].)\\n\\nThe evolution of emoji is impressive and fascinating, but it makes for an uncomfortable contrast when other pictorial writing systems – the most commonly-used writing systems on the planet – are on the chopping block. We have an unambiguous, cross-platform way to represent “PILE OF POO” (💩), while we’re still debating which of the 1.2 billion native Chinese speakers deserve to spell their own names correctly.\\n\\nThe Diversity Solution\\n\\nTraditionally, many emoji fonts have used a bright yellow skin tone. To demonstrate its commitment to diversity in Unicode, the Unicode consortium recently announced a new proposal, which will allow users to specify any of six different shades of brown for emoji faces. If the right icon is available, it will be shown; otherwise, a “default” face will be shown, next to a color swatch (so you can make it explicitly clear to your friends that you were, in fact, thinking about race when you texted them “White Frowning Face” (☹), “Man with Turban” (👳), or “Man with Gua Pi Mao” (👲).\\n\\nName, codes and samples of the emoji modifiers.\\n\\n(via Unicode Technical Report #51)\\n\\nPerhaps I wouldn’t mind that the emoji world now literally has “colored” people, if it weren’t for the timing. Instead, what could have been a meaningless, empty gesture becomes an outright insult. You can’t write your name in your native language, but at least you can tweet your frustration with an emoji face that’s the same shade of brown as yours!\\n\\nWriting for the 21st Century\\n\\nDetermining which graphemes and glyphs are essential to a given ethno-linguistic group is a tough problem. Identifying all of these for all languages in widespread use is even more challenging. But one thing is clear: we cannot design an alphabet meant for everyday use by native speakers of a language without the primary input of native speakers of these languages.\\n\\nOut of compatibility concerns, the Unicode Consortium is unlikely to modify the 224,024 characters that have already been defined in any future updates. It took half a century to replace the English-only ASCII with Unicode, and even that was only made possible with an encoding that explicitly maintains compatibility with ASCII, allowing English speakers to continue ignoring other languages.\\n\\nBut that still leaves 80% of the codepoints unused. As the Unicode Consortium decides which characters to allocate, there are a number of ways to ensure that Unicode accurately reflects the stated goal of representing “all characters in widespread use today”.\\n\\nMembership in the Consortium is not free, or even cheap. Full membership and voting rights cost $18,000 (and tellingly, all prices are listed in USD only). Discounts are already provided at lower membership tiers for non-profit organizations, such as the Mormon church. These discounts could be expanded to full membership, and to for-profit groups from non-European countries where English is a minority language. The Consortium could establish an explicit hiring plan to guarantee that its staff represent the many languages that it seeks to standardize. The Consortium could adopt bylaws that ensure that technical committee members and officers are not dominated by native English speakers. There are other measures that the Consortium can and should take as well, but these three are very straightforward both to implement and to evaluate, so they make a good starting point.\\n\\nGayatri Chakravorty Spivak has written, ‘The subaltern cannot speak’. They are structurally prohibited from having any dialogue – even an unbalanced one – with the very powers that oppress them. Access to digital tools that respect our languages is crucial to communicating in the Internet age. The power to control the written word is the ability both to amplify voices and to silence them. Anyone with this power must wield it with caution.\\n\\nWhatever path we take, it’s imperative that the writing system of the 21st century be driven by the needs of the people using it. In the end, a non-native speaker – even one who is fluent in the language – cannot truly speak on behalf the monolingual, native speaker. For them, the language is simply a way of exploring a different part of their world, or of exploring familiar parts in a new way. For the native speaker, the language is not merely a novelty. It is the gateway to accessing life and society itself.	2015-03-17
2	3	The Hidden Dangers of AI for Queer and Trans People	Technology has a long and uneasy relationship with gender and identity. On one hand, technologies like social media allow people to connect across large distances to share their personal stories, build communities and find support. Yet there have also been troubling cases, such as Facebook’s ‘Real Names’ policy where users have been locked out of their accounts and left without recourse. And routine smartphone updates that out trans people to their families, friends and coworkers.\\n\\nAs technology gets more complex and ubiquitous, these cases will continue to get worse. Widespread implementation of seemingly “objective” technology means less accessibility for those who do not fit developers’ conceptions of an “ideal user” – usually white, male and affluent. This is especially true with artificial intelligence (AI), where the information we teach AI directly influences the cognitive development of their machine brains.\\n\\nAs the co-founder of an artificial intelligence startup, I work with this tech first hand and have seen how inaccurate it can be with people who don’t fit the developer’s “ideal user.” Facial recognition – a subset of machine vision – is a tangible example, capable of causing great harm when it tries to recognize people it has been taught little about. As a queer and trans identifying person, I can see how this lack of understanding could physically and psychologically endanger queer people as AI integrates with our lives.\\n\\nGender and Racial Bias\\n\\nFacial recognition AI has been around for some time, but only recently has it been widely implemented due to better hardware and lower computing costs. Facebook’s photo tagging system – where photos uploaded are automatically tagged with your friends’ faces – is an example of a highly complex facial recognition AI which can not only recognize faces, but also connect the social relationships between the pictured face and your social network, to ask the seemingly simple question: “Is this your friend?”\\n\\nHow AI works tells us about how bias can be introduced into what is often assumed to be neutral technology. Imagine a library that’s just photographs of people’s faces, each sorted into groups such as “black hair”, “blue eyes”, “rounded nose”. Take these groups, and then sort them based on generalized patterns: for instance “blue eyes” is associated with the category of “caucasian.” What happens is that you get an AI intelligent enough to give a “read” and approximate an answer, but unable to deal with ambiguities and the spectrum of humanity’s natural diversity; for instance, a queer person might identify outside the gender binary, but is still put into a binary category by the machine.\\n\\nProblems are also introduced in how AI is “taught” to recognize people: for example, if a computer is primarily trained on selfies of one race, it will be less accurate with selfies of other races. This is one reason why AI already expresses pervasive, endangering racial bias. According to a recent article in The Atlantic, “Facial-recognition systems are more likely either to misidentify or fail to identify African Americans than other races, errors that could result in innocent citizens being marked as suspects in crimes.” These problems extend to consumer products: just last year, Google Photos, using AI technology, tagged photos of Black users as “gorillas.”\\n\\nAs these identity recognition technologies become more ubiquitous, we’ll continue to see how lack of diverse data to train AI adversely affects marginalized groups as they are literally not represented in the AI’s understanding of the world. This has particular implications for trans, genderqueer and other gender non-conforming people. Imagine you’re at a restaurant, you’ve had a lot to drink and you need to go to the bathroom. As you walk down the corridor, a camera scans your face to unlock the women’s or the men’s bathroom door according to the gender it perceives you as.\\n\\nThis is like those bathrooms that have keypad locks on them at restaurants where you need to get the password from an employee to gain access. What happens if the camera can’t understand your gender identity and the bathroom door remains shut? What if neither door will open? What if the wrong one does?\\n\\nIt’s not too difficult to imagine this bathroom technology not just malfunctioning, but also being used to enforce laws such as the recently passed HB2 in North Carolina which bans trans people from using bathrooms in-line with their gender identity. Right now, when queer-appearing people are in front of a facial recognition video camera, these systems keep resonating between the two gender binaries. If applied to bathroom locks, AI technology could restrict access to anyone that falls outside of these cis and binary gender norms or assumptions. A related incident happened the other week at a UK McDonald’s, where a lesbian teen was kicked out of the restaurant for using the women’s restroom, because employees thought she was male. If everything becomes automated by machines that don’t allow space for ambiguity, where it’s only binaries, ones and zeroes, more incidents like this are inevitable.\\n\\nBathrooms aren’t the only place where trans and queer lives are in physical danger. For example, the healthcare industry may adopt AI sooner than most other professions. When you’re getting medical treatment with a trans/queer body now, doctors are overwhelmingly discriminatory. They’re not used to us, and not sure how to treat unfamiliarity. Many trans people are unable to get proper medical care, prescriptions and gender-affirming surgery as a result of this discrimination.  If more and more medical processes are intermediated or administered by AI, this discrimination might get worse. If AI hasn’t been trained to understand and care for trans and queer bodies properly, it could be life-threatening.\\n\\nAI might make it even more difficult for trans people to get jobs. In New York for instance, there are many buildings that require ID to gain access. Usually you provide your ID to security and they call or verify your name on a list. This routine job will probably be replaced by a machine soon. If your ID doesn’t match your current name, like mine, I tell security not to use the name on my card. This edge case is a very complex task for a machine to understand, if it will listen to you at all. At the very least, it would reveal your legal name, thus outing you to a potential employer before you even interview. Across these spaces — from public life, to healthcare, to the workplace — trans and queer people face myriad risks from AI technology; these risks are especially compounded for queer and trans people of color, already facing the dangers of racial bias in AI.\\n\\nAddressing Machine Bias\\n\\nPerhaps one way of creating a more encompassing AI is to have larger and more varied data sets. In Care of AI to Come, my co-founder and I discussed how caretaking AIs should be trained on large socially diverse data sets in order for AI to better represent all kinds of people. Such large socially diverse datasets could be made available through open-source and wiki databases for researchers and corporations to come together. Sharing local data and pre-trained models will greatly improve and allow for better AIs to be built.\\n\\nBut even then, this won’t solve AI’s issue with non-normative gender identity. Only people can define their gender, and machines should not interfere in the process. We don’t have to limit the potential of machines just because it’s easier for us to limit sorting in our own heads. Instead, we should teach machines ambiguity, queerness and fluidity when it comes to identity, not just limit it to restricted classifications. One way to do this in AI is by employing deep learning networks, which are good at adapting to new trends over time without actually needing to assign labels to what it’s interpreting. These ambiguous trends are represented as multi-dimensional data points called tensors, strung together to discover hidden meanings and relationships within the network.\\n\\nUnsupervised learning algorithms that power tensor sorting such as K-means, allow identities to form organically as a limitless number of clusters. You can be a bit of this, and a bit of that and perhaps something else altogether new. For instance, if AI doctors are designed to treat all kinds of queer bodies and learn on the fly how to adapt to each patient’s individual needs while referencing similarly clustered past patients, then trans health would be more effective than it is currently, without needing to label what each person’s body represents.\\n\\nDuring this deep learning process, AI can get confused with nuanced socially-acceptable situations and how to treat people respectfully. The AI should know when to ask for help. AI should be teamed up with humans to avoid issues and provide a guidance, like a parent or teacher teaching right and wrong. We’re still in the stage where we have control over what a machine learns, called “supervised learning” where we label categories for an AI to sort things it identifies.\\n\\nUnsupervised learning is a major goal in AI right now, where the machine learns independently, from “input without labeled responses.” This means that it’s coming up with it’s own ideas about the world and what to do in it without human intervention. The AI dream of unsupervised bots is not here yet, but supervised learning is a good foundation to build toward it. We need to make sure this foundational layer is receptive and understanding of all identities.\\n\\nThe more we discuss the dangers of training AI on only small sets of data and narrow ideas about identity, the better prepared we will be for the future. Like most unaddressed issues surrounding representation of minority groups, it will take tangible and relatable problems that people are experiencing to truly understand that how we currently build AI is unsafe. We must express our concerns to ensure that our AI future is malleable and willing to listen and understand us, without judgement or discrimination. The promises of AI benefiting humanity should not outweigh the need to ensure that these benefits are equally distributed across all people, not just those people that fit into easy-to-sort categories for machine developers.	2016-04-25
3	4	Coding Bootcamps and Emotional Labor	In 2013, I graduated from Hackbright Academy. I did a coding bootcamp because it felt like my only viable option to be taken seriously as a junior engineer. I had a BA in Gender Studies, and had spent the past five years working in Human Resources. None of the Computer Science Bachelor’s programs nearby would accept second Bachelor’s students, and all the Master’s programs required a CS undergrad.\\n\\nAttending an intensive coding program can be an alienating experience: you’re the customer, and also the product. When I share my story, people only seem to hear “I Learned To Code In Just 10 Weeks: A Tidy Silicon Valley Narrative of Disruption and Innovation.” The year I put in before that taking classes at community college just doesn’t register, no matter how many times I mention it. There’s implicit and explicit social pressure to sell your experience, the dream, to inflate the brand on your resume that you paid so much for. People who are publicly critical of their Hackbright experiences have been shunned by the staff and large chunks of the alumni network.\\n\\nBootcamp programs require emotional labor as well as technical labor – during the program, and long after your graduate. Hackbright was never upfront about their emotional labor asks from volunteers, students, and alumni. To start, each Hackbright cohort is divided into groups of 3-5 students. Small groups were expected to schedule time to meet once a week to once a day, listen to each other, be encouraging, and come up with ways to bond as a team. Three students were designated as “apprentices” for the duration of the program. They, along with the instructors, were tasked with helping students when they got stuck.\\n\\nOn the volunteer front, Hackbright scheduled several (presumably unpaid) guest speakers per week for the duration of our 10-week class. The majority of these presentations were non-technical talks about women’s personal journeys into software engineering. Seeing role models is important; at the same time, it didn’t feel like a great use of their time or mine to hear so many personal stories, when I was there to learn to code.\\n\\nEven after graduating, the demand for unpaid emotional labor is high: Hackbright alumni are asked to give back to the community by mentoring current students, for a totally unpaid time commitment of about 10 hours per week. Graduates lead whiteboarding sessions with current students, organize events, and informally recruit new students. We are also expected to mentor and support recent graduates through the exhaustive process of fighting over the small amount of jobs available for very junior engineers who haven’t gone through a traditional CS program.\\n\\nWhy do grads agree to work for free? Hackbright representatives email us, saying things like, “Giving back and mentoring is the foundation our community is built on — because of mentorship relationships like this, our industry thrives.” It feels selfish to look at someone who is in the position I was once in, and put my own needs first. At the same time, it’s telling to consider all the beneficiaries of my labor.\\n\\nEvery time I help another alum get a job, or a student, Hackbright gets dollars and a boost to their branding. It’s problematic to send newly minted developers, who are themselves members of at least one marginalized group, into the industry with the notion that uncompensated organizing and mentoring work is expected of them. Ironically, Hackbright encourages graduates to aggressively negotiate for salaries from potential employers, but guards their own dollars much more closely.\\n\\nHidden tolls of emotional labor\\n\\nPeople underestimate the emotional side of technical work. The process of writing code generates lots of feelings for me. Frequently, I wrestle with my own anxiety about having started coding in my late twenties. Getting stuck on a problem bubbles up worries that I’m not cut out for my chosen career. In addition to debugging techniques, I had to teach myself how to calm down enough to get un-stuck. Although impostor syndrome impacts many engineers, it hits those of us who started late particularly hard.\\n\\nSometimes I feel like I have to be the organizational poster child for people from non traditional backgrounds: another axis to be marginalized and feel isolated on. People who want to learn to code reach out to me frequently. They want to meet up for coffee, career advice, and encouragement. My story gives them hope that they, too, can join the tech industry as a software engineer. Other grads have the same issue: the more visible you are, the worse it gets.\\n\\nChanging careers is a big decision. It’s understandable to seek advice from someone else who’s been there. I’m tired of having this conversation for multiple reasons, though. First, it’s irresponsible to wholeheartedly advise anyone who isn’t a white cis het male to become a professional software engineer. I’m not sorry I’ve changed careers, but it’s been challenging to say the least. Working in tech is a dichotomous tradeoff at the best of times. I have a high-paying job, with a large degree of autonomy. My work is intellectually stimulating. I have never before been so coddled in the workplace. But I am frequently the only femme, the only queer in the room. Odds are that I will be sexually harassed sometime in my career. Sexism is endemic, and I have to deal with a number of clueless men who refuse to do the internal work necessary to acknowledge that their behavior is part of the problem. This isolation and abuse is compounded for women of color, trans women, women with mental illnesses and/or disabilities, and other women who also face intersectional oppressions. We cannot just add underrepresented people to tech and stir: the industry needs to change as well.\\n\\nReframing\\n\\nThis isn’t about “fuck you, I got mine.” I have given my love, labor, and most importantly my money to other women, as I will continue to do. But emotional labor doesn’t scale. My time and emotional energy are finite qualities, and I’m barely keeping my head above water as is. In order to keep my skills relevant, I must spend time outside of work filling in my knowledge gaps, as well as learning new technologies. I have also taken on some diversity work at my day job, since I want to improve conditions in the industry. Performing corporate feminism takes a toll on my emotional health.\\n\\nIt’s exhausting to keep telling my story; and frankly, nothing about my path qualifies me to advise others. I, along with a hefty dose of my white privilege, won the bootcamp lottery: thus, I have a job. A lot of folks aren’t so lucky. Hiring in the tech industry is somewhat of an arbitrary game. As much as tech companies try to pretend like their processes are unbiased, technical interviewing is horribly broken. Coding schools aren’t very upfront about their placement rates, or how long it might take to get your first engineering job post-graduation. I have seen multiple Hackbright alumni put in month after month of job searching, grow despondent, and eventually give up.\\n\\nUnfortunately, bootcamps are merely another form of for-profit education that replicate the existing biases of the tech industry. That for-profit education is a sketchy industry, and that we need to forge alternative paths into the tech industry for folks with non-traditional backgrounds, is a foregone conclusion. When the tech bubble bursts, or rather messily implodes, there will be even less jobs for junior developers, which doesn’t bode well for the bootcamp economy.\\n\\nCoding schools should be more upfront about the downsides of their program, such as how long it takes to find a job afterwards. They should avoid relying heavily on volunteer labor and alumni goodwill. Additionally, schools should acknowledge that part of their business runs off emotional labor, and take steps to mitigate the negative impacts on students. For example, Dev Bootcamp has a counselor on staff, and teaches “Engineering Empathy” as part of their curriculum. Paying speakers to come to the classroom would raise the bar for talks. Additionally, alumni should be compensated for their mentoring and recruiting work, since it benefits Hackbright as a business.\\n\\nUltimately, I am not obligated to provide unpaid emotional support for everyone who is thinking of learning to code. I propose a radical notion, wherein bootcamp graduates stop providing free support for other folks who want to get into tech. Unless those folks are oppressed along an axis where you are privileged: if you are part of any marginalized group I am not part of, and you want my advice or support, paying it forward is the least I can do. Structuring this work as ally work helps marginalized people set boundaries around emotional labor, and makes this problem scalable. Allies can, and should, be picking up the slack here. White cis het men, especially, are better positioned to give career advice and mentorship, since in most cases they’re the real gatekeepers for the tech industry.\\n\\nI refuse to be the poster child for non traditional backgrounds in the tech industry, and I refuse to let the tech industry continue to feast on my story. Bootcamps are a micro example of how the tech industry is built on the emotional labor of the same groups who are marginalized within it. It’s past time we started demanding recognition, and pay.	2016-03-14
4	5	The Problem With the Zuckerberg Analogy for Youth of Color	The next Mark Zuckerberg. Where is he?\\n\\nMany in Silicon Valley are looking for him at coding bootcamps, Hackathons, and similar STEM programs aimed at young people, hoping to discover the wunderkind of color that will follow Zuckerberg’s path of tech royalty and represent the racial progress of an industry dominated by young white men.\\n\\nAs someone who believes in the possibilities of technology in uplifting our most marginalized populations, I too want to see the industry grow in ways that celebrate the brilliance of underrepresented youth. But there is something deeply pernicious about the Zuckerberg analogy that hurts more than helps when encouraging youth of color to be their greatest selves – and its not just its sexist undertones that minimize the contributions of women and girls to the coding landscape. The real problem involved in “looking” for the next Zuckerberg is the underlying assumption that once we find him, all will be right in the “diversity in tech” world… ultimately placing a large burden on youth of color to be exceptional in the face of adversity as proof of racial progress.\\n\\nPromoting exceptionalism to encourage success is not new to people of color. We have historically struggled in a dominant culture that upholds a bootstrap narrative which says you can rise above structural inequalities, only if you work hard enough to do so. Those who do overcome to achieve some semblance of success are considered exceptional and as Imani Perry notes, become false symbols of “evidence that racial inequality doesn’t exist.”\\n\\nWhile “exceptional” individuals enjoy unprecedented levels of access and privilege, their visibility does little to dismantle systemic barriers that prohibit other people of color from achieving the same. Furthermore, their presence as one of few reduces the reality of discrimination to the fault of its victims and not the result of actual racial disparities that limit the socioeconomic mobility of African Americans and Latinos. In other words, a brown Mark Zuckerberg is not going to change the fact that kids of color continue to be underrepresented in STEM — not because they aren’t brilliant enough, but because they have not been given the same amount of opportunity, access, wealth and individual room to fail, unlike the privileged Facebook founder they are told to aspire towards. Without an honest conversation of how privilege and power function in regards to race, the image of a singular white male as emblematic of tech success can foster a competitive environment amongst youth of color who already have to compete for basic educational resources that remain unequally distributed.\\n\\nEssentially, it is the absence of a critique of white privilege embedded in the Zuckerberg analogy that reveals its contentious relationship with meritocracy — a concept that a tech culture concerned with rewards and perks for those that are considered more deserving than others, is no stranger to.\\n\\nIn writing about meritocracy in tech, Ashe Dryden argues that the consequence of an industry based on “merit” is the reproduction of oppressive hierarchies where “some of those at the top or striving to at least be above other people have been guilty of using their power for bullying, harassment, and sexist/racist/*ist language that they use against others directly and indirectly.” In such situations where power results in abuse, women of all races are the most vulnerable and can endure career threatening “punishment” when addressed, thus maintaining a heterosexist social order that benefits white masculinity and subordinates other identities.\\n\\nConsidering then how “meritocratic” spaces can marginalize individuals at risk, its reinforcement has multiple implications for youth of color, primarily in relation to gender and sexuality. Take for example the population of LGBT youth who make up a significant portion of the ”next Zuckerberg cohort” but whose presence in tech comes along with the fact of cyberbullying – affecting the community at almost twice the rate of their peers. Since these students already deal with the external discourses of meritocracy that dismisses their harassment as a queer rite of passage because, supposedly, “it gets better,” the celebration of white masculinity can further justify feelings of inferiority and perceptions of abnormality from their peers… unwittingly creating a new barrier of adversity that implicates all youth of color to transcend a set of social prejudices that they might not be equipped to.\\n\\nBeyond promoting the idea of exceptionalism based on merit, the widely used Zuckerberg analogy marginalizes the contributions of young people of color that have already made history in STEM but receive little recognition for their efforts. For instance, Luis Roberto Ramirez is an 11 year old who studies quantum physics at Harvard; Anala Beevers was invited to join MENSA at just four years old; and Jaylen Bledsoe, who in his early teens, runs his own multimillion dollar global IT company, Bledsoe Technologies. These children are not exceptions, rather they are perfect examples of the abundance of brilliance that thrives in communities of color in spite of existing systems that attempt to destroy it or claim that it doesn’t exist. What would the tech industry look like if these types of stories were championed over that of young white men?\\n\\nEven if unintended, the Zuckerberg analogy avoids the looming issue of systemic discrimination and limits paradigm-shifting conversations that can change how we discuss race and access in tech. If we continue to use it in the context of educating youth of color, we must do so in a way that also helps them to develop a critical lens with which to view social disparity. The industry needs it and the youth deserve it.	2014-01-13
5	5	It is Bigger Than Microaggressions	I am new to tech.\\n\\nI’ve spent the majority of my adult career as an independent artist writing, directing and filming my way into avenues of visibility while moonlighting as a public scholar. In both artistic and academic spaces, I’ve centered my material reality as a black trans* person with the primary intention of expressing my humanity.\\n\\nThis past year my career took a turn in a new direction as I took the leap of blending my love of creativity with my passion for gender justice, resulting in the birth of Trans*H4CK — a tech initiative that celebrates the work and contributions of trans* and gender non-conforming people within the industry.\\n\\nAs Trans*H4CK has grown, I’ve found myself occupying a unique position in being able to move through a number of different tech spaces: from rooms filled with the verve of tech entrepreneurs of color to being the singular black (trans) male voice in extremely passionate queer feminist spaces.\\n\\nWhat I’ve discovered is that even though there is a growing trend to expand the concept of diversity, overall the tech industry doesn’t yet allow for a critical and nuanced approach to trans* identities, especially when it comes to individuals who occupy the margins of race to which many seek to be inclusive of. Because of this, gender-based marginalization in the form of microaggressions — unconscious verbal comments or physical gestures that communicate shameful, demeaning and sometimes violent messages — from well-meaning colleagues, bosses or business partners occur daily.\\n\\nThe nature of gender-based microaggressions can make them hard to identify. Veiled compliments about the youthful appearance of colleagues that are women (e.g. you look too young to have this position!), or unsolicited advice, such as mansplaining for example, are but a couple of ways in which dominant perceptions of gender are used to subordinate. Within the culture of tech, there are multiple ways in which microaggressions affect a broad spectrum of identities, but as Shanley Kane points out they “are disproportionately and sometimes exclusively used against employees who are not white, male, straight and masculine.”\\n\\nStereotyping Anger\\n\\nIn industries dominated by white leadership, the notion of black success is wrought with respectability politics that convey a sense of passivity. For black queer people in particular, career advancement can sometimes mean eschewing radical politics that challenge race, gender and sexual identity hierarchies in order to avoid being marked as “angry.” Tech is no different.\\n\\nThere have been many instances in my journey where comments or suggestions from white counterparts have alluded to or explicitly labeled me as hostile for refusing to comply with discriminatory practices masquerading as diversity initiatives. To give an example, I once worked with an all-white and predominantly cisgender tech-based organization that wanted to broaden its reach into the LGBT community. When I respectfully expressed to the organizers that their curriculum, location and financial costs to attend made it unappealing to participants of color, I was told not to “focus on race so much” since it wasn’t a “central issue.” When I pushed back against the subtle racism of the statement, I was labeled as being divisive to the overall goal of the project and simply just angry.\\n\\nSimilarly, during a party for a tech company launch, I fell into a deep conversation about gentrification with a group of queer white people. One person gushed over how he feels safe in his historically gay San Francisco neighborhood in spite of his trans* identity. I shared that I never feel safe where he lives because of the feeling of being under constant surveillance as a black man. Afterwards on the BART ride home, I received a public tweet where the person expressed their gratitude in me “calling them out” — a term rife with confrontational undertones — to assess their privilege.\\n\\nFalse accusations of anger as a default response to black queer critiques of marginalization invalidate the realities of racial discrimination that exist in tech by positioning black people as domineering race police and whites as unsuspecting victims. This hinders coalition-building across underrepresented groups as the threat of black anger incites fear amongst non-black colleagues. This is unfortunate especially when we consider the overlap with regard to how feminists of all races in tech are categorized as aggressive and reactionary when challenging misogyny.\\n\\nMisgendering and Outing\\n\\nI try to make my gender identity known as often as I can to prohibit any moments in which someone is misinformed about who I am. This doesn’t always work and I’ve been on the receiving end of both public and private instances of misgendering from colleagues who are either unaware of trans* people or are simply not interested. As a sometimes optimist, I tend to hope for the former.\\n\\nA few weeks ago, I attended a non-LGBT meetup for black tech entrepreneurs. I was excited to attend as I had planned on meeting a longtime Twitter pal whose work I’ve followed across the years as they had reciprocated the favor. Upon spotting one another across the room and rushing to make introductions, my Twitter pal reached out and remarked that I “looked more like a real man in person than in my avi.” She then followed her “compliment” by introducing me to her friends using the incorrect gender pronoun while gloating about my work, at which the friends seemed visibly confused.\\n\\nIn another situation, a colleague new to trans* issues, took it upon themselves to share with their entire office about my gender. I shared with them how uncomfortable it made me feel to be outed in situations not related to my work without my approval. Their response was that they assumed it to be okay and that I should be happy to be seen as an “example of a successful black transgender person to a group of straight people.”\\n\\nDespite the different context, both scenarios are examples of how gender-based microaggressions reinforce sexist thinking against trans* people. Though my Twitter friend followed my work, her comments implied that my expression of masculinity was not up to par — a slight that refuses to acknowledge me as real and instead as a gender imposter. On the other hand, using my public work and race as an excuse to disclose my gender, strips me of the agency of self-definition and reinforces the harmful idea that one singular person can represent the entire black community.\\n\\nClass Matters\\n\\nWorking in tech for many of us also means networking alongside a lot of well-paid people. It is often during meetups, brunches, or beer outings, in which I am asked about my income on such invasive terms such as “how do I pay my rent?” rather than what is my occupation. If I’m not being questioned about my paycheck, I regularly sit through stories of financial excess under the guise of economic transparency (e.g. I once had a white male colleague boast that since he was “rich and white” he felt it important to share his wealth to contribute to the trans* experience).\\n\\nWhile there is a current push from many to be more open with sharing salary information to address economic disparity in tech, for people of color whose work is unapologetically informed by a social justice lens, there are hidden implications behind on-the-spot demands of our financial credentials. For one, it reflects a particular type of (white) privilege that believes that people of color are expected to respond to interrogation no matter the subject matter. It also minimizes the importance of socially urgent work by commodifying its reach and assumes that our labor is literally worth(less). Beyond that, comments that praise one’s contributions to a marginalized community in order to relate to them, are self-aggrandizing at best.\\n\\nIt is Bigger than Microaggressions\nThere are many people working in tech who identify as anti-racist, gender inclusive, or socially conscious, however the microaggressions aimed at black queer people are largely overlooked and ignored. These assumedly insignificant acts normalize our mistreatment, making a strong impact on our physical and emotional health and overall productivity. In order to change this, we all have to be vigilant in allowing marginalized individuals in tech more spaces in which to speak truthfully and without judgment –our lived experiences are key factors in fully understanding how microaggressions operate. At the same time, energy must be directed towards incorporating race and gender educational frameworks alongside “learn to code” initiatives as the cultural costs of microaggressions that devalue queer people of color, greatly outweighs the financial cost of investing in work that challenges racist, sexist and transphobic thinking.	2014-05-19
6	6	Side Project Culture: Opportunities and Obstacles for Marginalized People in Tech	My first side project was a stock market website that integrated Beyoncé gifs reflecting the state of the exchange. I didn’t know how to code back then, but I helped provide the idea, the gifs, copy editing, and aesthetic feedback. My friends and I grew closer through building the project, and we each had a new shiny trophy to put on our personal websites as the site picked up media attention.\\n\\nSince building Beyoncé Trader three years ago, I’ve worked on around a dozen other side projects, all ranging in size, impact, and popularity. They’ve taken a lot of my time and energy. My grades were not always perfect because of them. I’ve lost sleep because of them. I’ve wasted a fair amount of time because of them. And yet, a lot of this work has paid off. It’s no secret that side projects can have a huge impact on your life and career in tech. When job hunting, I was regularly asked what kinds of side projects I had worked on in the last few months, and how those projects made me a better candidate. I’ve been asked to speak at conferences and hackathons because of them. Side projects open doors for opportunities through the process of building, collaborating, meeting new people, and sharing your interests and findings with the world.\\n\\nHowever, the impact of side projects becomes more complex when you consider how the industry’s emphasis on them inherently disadvantages people who cannot regularly work on them. Yes: in an industry that keeps minorities from educational and career opportunities, working on projects in your free time is one of the best ways to combat an unfair lack of experience. At the same time, the hardships that disproportionately affect minorities make it much more difficult to work on side projects in the first place. In this piece, I provide some tips and insight that marginalized people might find useful to start their own side projects, as well as address ways the tech industry can cultivate a more inclusive culture around this “extra curricular” work.\\n\\nSide Projects: A How-To\\n\\nThe entry points to building side projects are endless. There are open source communities, volunteer programs, freelance opportunities, classes that need assistance, and of course, free range to build anything from scratch. The best side projects, in my experience, stem from the combination of genuine interest and critical thinking about how to most effectively share something with the world. Last year, I decided to make Name That Drake Song, a data visualization that showcases song titles from Drake’s most recent album. I love data visualizations, and I love smart and sincere pop culture references. I was genuinely interested in learning something new, having fun with it, and sharing what I built with others: these sentiments are often the essence of starting a side project.\\n\\nThe hazy aspect of side projects is that they often fit in an unclear intersection of work and recreation, which makes identifying the right work-life balance a bit tricky. Once you’ve started working on your side project, it’s easy to become invested. Two years ago, a friend of mine and I were working on a side project called Hackers Of. Hackers Of started off as an interview series in New York City, where my friend would interview people in tech and showcase something interesting that they built. Wanting to get involved, I started a Los Angeles branch (where I was living at the time), and within a few months, Hackers Of exploded into a community of interviewers in 13 cities in nine countries worldwide. All of a sudden, this side project, which at first only took an hour or two of my week, demanded a lot more of my time. I had to rethink and restructure the type of commitment I was expending to this project, and how it affected my day-to-day.\\n\\nWhen it comes to side projects, burnout can happen very rapidly, which leads to exhaustion and lack of motivation. The best thing you can do is balance making progress on it with staying true to dividing up your work and relaxation time. Learning what it means to plan ahead, and being honest about how I tend to use time, has been a deeply personal, and sometimes frustrating process, but it has allowed me to avoid the (sometimes inevitable) unfinished project, or burnout.\\n\\nFor marginalized people who don’t have the financial privilege to work for free on side projects, seeking funding can be a great way to help incentivise spending your time working on them. To get your projects funded, you can seek out companies, organizations, and grants that do work and possess values that align with what you want to work on. For example, the Awesome Foundation regularly gives grants to people to want to work on anything remotely interesting. There are also crowdfunding options, like Patreon. For students, asking your university for funding, or doing projects through school clubs or organizations, are great options for support. Hackathons, which are primarily student-oriented and often cover expenses, are a great option for this as well. I’ve hosted literally dozens of tech events in my free time with the help of school-affiliated resources, and through these events have been able to work on various side-projects.\\n\\nAs much as I’d like to encourage people to seek funding for all of their work, it’s difficult, and much more time consuming than opting to do your work for free. While side projects are fantastic in a lot of ways, there are definitely costs, which can fluctuate according to circumstance. When working on side projects, you should clarify how much work you are willing to expend outside of your primary responsibilities, and how that amount can change depending on external incentives, such as financial compensation. A tip for budgeting for side projects is to estimate how long a project might take you, consider expected income from other sources during that time, and how working on said project may affect other parts of your life. By writing these factors down, projecting costs becomes easier, and you have a point of reference while building your side project to ensure that you are in a good financial standing.\\n\\nSide Projects: Community Solutions\\n\\nThrough projects like Beyoncé Trader, Name that Drake Song, and Hackers Of, I’ve learned about how to attempt, make, fail, and succeed at making side projects. There’s no denying that there are a lot of really great aspects of getting started, working on, and ultimately shipping a fantastic side project. Each stage in the process is an opportunity for growth, and that’s something that would be great for most people in tech to experience. But alas, the greatness of side projects begin to stifle when overemphasis on them in the industry puts people at a disadvantage.\\n\\nFor example: The technology industry is notoriously young and privileged, and consequently, many people who work in tech full time don’t have family obligations. Older people in tech, who often have families to attend to, simply have less time to work on side projects. People with mental illness and disabilities may also have a much more strenuous time doing work both in and outside of the office. And some people, quite simply, can’t afford to take on free labor. Whether you’re too busy job hunting, dealing with the emotional stress of regular discrimination and microaggressions, or simply uncomfortable in a system that regularly inhibits you because of your differences, it can be incredibly taxing to also work on side projects, even if they are of interest to you. While discrimination in tech persists, the need for marginalized groups to partake in side projects increases… and their ability to do so decreases.\\n\\nWhile side projects can be a great indicator of personality, ability, and work-ethic, they should not have as much ability to make or break someone’s career. A side project is definitely a great talking point, and useful for employers. However, to be fair in hiring and generally more aware of advantages and disadvantages in our society, side projects should not be expected of everyone, and should certainly not be held at a significant disadvantage. While side projects can be great addition to a portfolio, expecting them disadvantages people who do not have the bandwidth to work on them.\\n\\nTo help close the gap and incentivise side projects for people with limited time, companies, grants, and diversity initiatives should look more into funding side projects. With a financial return, people with limited time and resources are better able to invest their time into reaping the benefits of side projects without having to sacrifice free hours in the day. This type of funding could manifest in various ways, simply starting with being receptive to funding requests from people who contact companies with similar missions/values. For larger companies, this could evolve into a dedicated team that works on handling various requests, as well as actively seeks out partnerships and support opportunities for people and teams working on personal projects that happen to align with the mission of the company. The ultimate hope is that with time, the technology industry can establish a culture where people feel comfortable seeking more support for work they do in their free time, and the world of side projects becomes a little more forgiving.\\n\\nConclusion\\n\\nSide projects are great. They can be fun, motivational, and unique. There are a lot of different ways to get started working on side projects, and clear and tangible benefits for sticking to them! For many people who are looking to gain experience or spice up their portfolio, side projects are a wonderful option. But in order to promote equality, and to stress well-being and fairness in the industry, it is essential for technology companies and organizations to not mandate side projects as an “in.” We all have primary responsibilities which are a time priority and may trump our desire to stay up late for the side project we planned on finishing today.\\n\\nAnd that’s okay.\\n\\nAt the end of the day, you should work enthusiastically and responsibly, and while that means saying yes, sometimes, it means saying no.	2016-03-15
7	7	Technology Colonialism	The Colonial Period spanned from the 16th Century to the period after World War II. It is often romanticized as a period of exploration and adventure when merchant ships laden with the spoils of exotic lands returned to European ports. However, the reality of colonialism was the exploitation, enslavement, and genocide of indigenous people, and the industrialization of global human trafficking.\n\\n\\nThe abuse and degradation that indigenous people suffered under colonialism and imperialism resulted in devastating consequences that persist to the present day. The real damage done is too great to simply be used as an analogy, but the pattern, ideology, mentality and operating practices of colonialism persist today across the globe… and in our industries.\\n\\nColonialism is now seen by many as a discredited form of rule, but technology companies today are increasingly colonial in their actions. This can be seen in the veneer of sovereignty they seek to cultivate, how they work across borders, their use of dominant culture as a weapon, and the clear belief that “superior” technology is a suitable excuse for lawlessness, exploitation and even violence.\\n\\nSovereignty\\n\\nTechnology companies are increasingly being treated like sovereign nations. A nation with sovereignty has a right to conduct its internal affairs without interference from other nations. A nation’s sovereignty is recognized when the borders, people, and central government of that nation are recognized by other nations, and one of the traits of a sovereign nation is the ability to have diplomatic relations with other sovereign nations.\\n\\nWe see tech companies and conglomerates as increasingly resembling sovereign nations in the diplomacy extended to them by actual sovereign nations. For example, last October Mark Zuckerberg gave an almost ambassadorial 30-minute interview entirely in Mandarin when he visited a university in Beijing. In December, Lei Wu, the top internet minister in China, met with Zuckerberg, Tim Cook, and Jeff Bezos at their corporate offices. Wu’s trip was a recognition of the desire of technology companies to tap into the huge Chinese user base. Even the head of state for the country in which many tech giants are headquartered has sought audiences with their leaders. In February of this year, President Obama spoke at Stanford University about the importance of technology companies helping the US government fight cyber-attacks. However, despite being invited, Zuckerberg, Marissa Mayer, and Larry Page and Eric Schmidt, perhaps feeling their own imperial bona fides, decided to skip the president’s speech. Given their questionable interest in the privacy of their users, it’s ironic that these tech CEOs allegedly snubbed Obama over the federal government’s invasion of the privacy of its citizens.\\n\\nWhen technology companies are feted by foreign ministers and also refuse an invitation from the leader of their own country of origin, they exhibit the characteristics of a group that wants to be treated as a peer to heads of state. Technology companies understand the power they wield in the global economy. In fact, Apple recently posted the most profitable quarter of any company in world history. While other sectors of the world economy like the energy industry also wield vast economic power, the technology industry is singular in the manner in which it can covertly collude between companies. Oil and gas companies have strict anti-trust laws that go back to the breakup of Standard Oil in 1911. Even today, regulators can detect when energy companies engage in price fixing, monopolization of assets, intimidation or other anticompetitive practices. This detection is often done by analyzing the accounting information that publicly traded companies are required to report.\\n\\nWhile technology companies are required to report the same accounting information, they have the ability to do something unique. Technology companies, though legally organized as separate corporations, have the potential to covertly operate as a single sovereign entity because the technology products and services they create are increasingly dependent and interoperable with each other. Furthermore, the rise of cloud computing has decreased the importance of the branded platforms created by technology manufacturers. Google’s Gmail app works on its own line of Android tablets and phones, or the iPad and iPhone. Last November, Microsoft made the iOS and Android versions of its mobile Office suite free. There is a clear desire by many technology companies to create products that consumers can use regardless of the type of platform they have chosen.\\n\\nThis “platformless” approach to product development even extends to our homes and health. Eric Schmidt recently stated that “the internet will disappear,” meaning that it will become a seamless experience that makes the line between reality, technology and technology companies impossible to distinguish. Schmidt used the example of a person walking into a room and having that room configure itself based on that person’s individual preferences. Such a user would not know or care if the music service was provided by Apple, the temperature controlled by Google, or if social media information about the other people in the room was provided by Facebook, Twitter, or LinkedIn. They would simply enjoy the presentation of the information and the system’s ability to meet their preferences.\\n\\nWhile such a tailored experience may be desirable, it masks the centralization of extremely private information. An internet that has disappeared means that the companies who leverage it are, for all intents and purposes, invisible. The software that manages the experience becomes homogenous in nature and centralized in operation. This “Invisible Empire”, despite being made up of distinguishable public companies, becomes a tech collective operating as a sovereign entity that seeks to provide a unified user experience. Such an entity would be considerably difficult for our current antitrust laws to detect and regulate.\\n\\nThe propensity for technology companies to act on shared interest and goals can be seen in recent legal battles. Just last May several technology companies including Google, Adobe, Intel, and Apple settled a lawsuit alleging that the companies colluded to control hiring practices. This lawsuit was a civil case that emerged from a federal case in 2010 that was settled out of court. Evidence was presented that this conspiracy to control talent even reached the CEOs of technology giants in the form of emails between Steve Jobs and Eric Schmidt. These emails showed that attempts to hire an employee away from another company in the collective would be a career-ending move by the person responsible. By colluding to remove employment options for their talent, these technology companies could limit the salaries demanded by their employees.\\n\\nIf technology companies, despite being separate public companies, are willing to essentially operate with one collective HR department, how hard is it to believe that they could centralize other business functions? After all, companies use centralization inside their corporate walls to remove inefficiencies and gain economies of scale. A centralized software development capability that reached across corporate walls would also provide business value. Technology companies already use a common culture that is homogenized across the technology community. A software engineer who does manage to move from a job at Google to one at Facebook will probably find herself in the same open working spaces, development tools, and after-work activities she experienced at her previous company.\\n\\nThe capability that technology companies have to operate as a single sovereign entity makes them a formidable colonial power. This grants them wide latitude in manipulating domestic and foreign heads of state. Combined with the ability to collude in ways that are nearly undetectable, the sovereign power of technology companies can cause disruption on a global scale unachievable by other industries.\\n\\nA Global Footprint\\n\\nTechnology companies have customers in countries around the world. Facebook has over a billion active monthly users, and since it, like Google, is essentially an advertising company, gaining more users around the world is critical to the satisfaction of its investors. Spurred on by aggressive ideas like “software eats the world”, it’s clear that imperialistic global expansion is seen by technology companies as a world-wide war.\\n\\nThe fierceness of how technology companies desire to strengthen their international presence can be seen in how they come into conflict with sovereign nations. An example of this can be found in Google’s contentious relationship with China. After friction over search censorship in 2009 and 2010, Google moved its operations out of mainland China and then relocated to Hong Kong. Since then, China has blocked and unblocked Google services with the latest block of Google and Gmail occurring in December 2014.\\n\\nSome may argue that the global success of American-based technology companies is beneficial since it results in international profits flowing to companies based in the United States. If companies like Google and Facebook are successful in deriving immense revenue streams through their operations around the world, then that means more wealth for the Silicon Valley communities in which they are based. In turn, these profits can be used to create more innovative products and services that benefit everyone. However, the centralization of economic power in Silicon Valley is also accompanied by the centralization of private user data from around the globe. Few things are more personal than what people communicate using email, post on social media sites, or put into search engines.\\n\\nIf Silicon Valley is allowed to become the central repository of information about people around the world, then there is a danger of setting up a form of imperialism based on personal data. Just as the royal powers of old reached far into the lives of distant colonized people, technology companies gain immense control with every terabyte of personal data they store and analyze. As services like Apple Pay seek to own global customer retail transactions, technology companies will gain even more insight into the lives of people around the world. While the need for such data will be rationalized as necessary for a better user experience like targeted advertisements, technology companies will doubtless find the resale value of personal data to be irresistible. Some insurance companies are already combing through social media accounts to price policies for customers. Recognizing the power of so much personal information collected in one place and possibly sold without consent explains why efforts are being made to improve privacy laws.\\n\\nHowever, privacy laws are only enforceable within defined nation-state borders. While these efforts are hard to detect, there are hints that some technology companies may seek to exist outside of national borders entirely. For example, over the past few years a set of Google Barges began to appear on the western and eastern coasts of the United States. These were seafaring vessels that were made of welded-together shipping containers. While some described them as Google’s version of “floating Apple Stores”, no one could determine their true purpose. The local government officials that had a legal right to question Google about the barges before granting them the appropriate permits signed non-disclosure agreements. Toward the middle of last year, the barges were dismantled and sold as scrap.\\n\\nGoogle has a history of beta testing experiments, and the Google Barges could have been an early attempt at sea-steading. Sea-steading is the attempt to create non-governmental entities outside of recognized borders and gain freedom from legal control. If technology companies could create sea-steads, then they could set up operations outside of legal restraints. Imagine a collection of barges anchored in international waters housing the servers of several technology companies. These floating data centers could be cooled by the ocean and connected to the internet by an undersea cable. Serving users around the world requires global placement of data centers, so a network of connected sea-steads could be constructed outside of national borders but geographically close to major metro areas. This would create an imperial nautical empire that could reach billions of users yet be unregulated by the nations in which those users reside.\\n\\nCultural Domination\\n\\nEuropean colonizers justified oppression of indigenous people around the world with the belief that white men were superior to every other race, that they had a divine right to convert native people to their belief system and adhere to the social hierarchy of patriarchal rule.\\n\\nThis behavior is echoed in the elitist attitudes embedded in the technology industry and the white men who lead it. These white men found most of the companies in the sector and build entire business models on the personal data of marginalized people. Companies like Facebook, Twitter, and Google are predominantly used by women and minorities whose data and usage patterns are sold for profit. Yet, these groups are often blocked from working at technology companies or encounter abuse if they do manage to gain employment.\\n\\nThis idea of white male superiority is not limited to the upper ranks of technology companies. Technology culture cultivates the idea of “10x engineers,” legendary hackers who can accomplish feats of software engineering far beyond anything an average programmer could. Of course, the 10x engineers are rarely envisioned as women or people of color.\\n\\nEuropean colonialism was spurred by an interest in trade with foreign nations. This involved the exchange of materials and products between the colonial powers and foreign nations. However, there was one product that was always part of the transaction: the concept of white male superiority. Colonial powers always saw themselves as superiors over the native people whose culture was rarely recognized or respected. The colonizers saw economic value in these foreign relations, but it was always viewed as a transaction based on inequality. Technology companies continue this same philosophy in how they present their own products. These products are almost always designed by white men for a global audience with little understanding of the diverse interests of end users.\\n\\nThe imperialist and colonialist mindset has also resulted in abuse of immigration laws that regulate the filling of technology jobs. Multinational technology companies use L-1 visas to transfer foreign workers to positions in the United States. Unlike H1-B visas, there is no limit on the number of L-1 visas that can be issued, nor do companies have to pay market wages. Technology companies can use L-1 visas to import cheap technology talent into the United States, setting the stage for global worker exploitation.\\n\\nAbove the Law\\n\\nAlthough technology companies are scrutinized by government regulators and the media for compliance with the law, they largely operate unregulated. Unlike Oil and Gas companies, technology companies don’t have their emissions monitored. They don’t need permits to drill. Since the details of how technology products and services work is not understood by the general population, technology companies can exploit this ignorance to their advantage.\\n\\nGovernment entities are further stymied in their ability to monitor and regulate technology companies because of their reliance on technology. A large portion of city, state, and federal government agencies run Microsoft Windows. This includes military systems and classified information. It is unclear how much pressure these government bodies can impose on companies like Microsoft when they are so dependent on the company’s products.\\n\\nTechnology companies understand the ignorance of the general public about how they work and how dependent agents of the law are on their products. This understanding often results in actions that violate laws simply because they stand in the way of a desired result. For example, Google Books was an attempt to scan millions of books into digital format. Google wanted to add this information to their search data set despite objections from authors whose copyright protections would be violated. After almost a decade of legal battle, Google prevailed in the courts who agreed with their fair use claims.\\n\\nGoogle Books was a public move to violate copyright law, but what happens when technology companies violate laws in a covert manner? In February of this year, it was revealed that Lenovo violated the security and privacy of their customers by pre-installing an adware program called Superfish on their laptops. This program allowed remote access to the customers’ machines, potentially exposing them to identify theft and the loss of personal information. While Lenovo acted quickly to provide tools to remove Superfish, it had been in the wild since September 2014. So, for months customers were exposed to potential harm simply because Lenovo wanted the ad revenue.\\n\\nSome technology companies flaunt their willingness to operate in violation of local laws. Transportation service company Uber has launched its service in cities even when it operates in violation of city ordinances. The company’s non-compliance with city ordinances ranges from Uber drivers not having the required driving permits in Orlando to refusing a request by California state regulators to provide information about their drivers. Uber’s skirting of the law extends globally to its battle with the European Commission about its operations in France.\\n\\nEven when technology companies operate within the law, they can inflict damage at the local level. The tremendous wealth created by Silicon Valley technology companies has resulted in gentrification forcing out long time city residents. Over the past decade, developers and designers who flooded into the high-paying jobs offered by the Valley’s technology industry have caused evictions under the Ellis Act to skyrocket. Other areas of the country, seeing the harm that the arrival of technology companies can do to residents, view proposals for local tech campuses with fear and uncertainty.\\n\\nThe Need for Investigative Technology Journalism\\n\\nTechnology companies will continue to increase the impact of their colonial power on the world because it aligns with their competencies and culture. Technology companies are strongly positioned to gain more users of their products and services as they seek to enter global markets and skirt both national and local laws. Consumers have been willing to trade large measures of their privacy and security for the conveniences offered by technology. Immensely personal information is poured into Google search and posted on social networks despite the danger of having that information centralized and sold for profit. End user information is the lifeblood of most technology companies and many of them seek to wring every last drop from the world’s population.\\n\\nThe culture of the technology sector is one that fosters elitism and an appetite for world domination. Despite needing customers to survive, technology companies, especially large ones, often foster a culture of disdain for these same customers. Cable companies like Comcast and Time Warner Cable have been particularly sloppy in letting this disdain come to public light. This February, a customer complained that Time Warner Cable changed her first name to “Cunt” in their system. Last summer, it was revealed Facebook performed massive experiments on the moods of its users by manipulating its news feed. These examples show a three level pyramid of how tech companies view the world: elites at the top who do what they will, minions in the middle who do their bidding, and the masses at the bottom who are mined for profits and data. This pyramid harkens back to the colonial view of the world: crown, conquerors, and captives.\\n\\nMost of the abuse of the technology industry is discovered by technology professionals. The collusion over hiring by technology companies came to light after a class action lawsuit was filed by disgruntled technology workers. The Superfish virus that Lenovo pre-installed on users’ machines came to light after hackers posted screenshots of the fake web certificate. However, these revelations are reactive in nature, random in occurrence, and often take place after the damage has already been done. Consumers need proactive protection that monitors the actions of technology companies and prevents them from abusing their power, or blunts the results of their actions. The press is best positioned to play this role. However, the press has utterly failed in holding the colonial and imperialistic aspirations of technology companies in check.\\n\\nStandard Oil was perhaps the canonical representation of a megacorporation in the United States. It exercised true monopolistic power through anti-competitive practices like price fixing and intimidation of competitors. One of the primary contributors to the downfall of Standard Oil was the work of investigative journalist Ida Tarbell. Factual examination of Standard Oil lead to the breakup of the company and even tarnished the reputation of John D. Rockefeller, one of the wealthiest people of his time.\\n\\nTechnology journalism needs 21st century versions of Ida Tarbell. These are journalists who understand the complexities of technology, have the ability to translate that complexity into terms the general public can understand, and are not afraid to confront wealth and power. This type of investigative journalism is the best hope for protecting the world from the colonial technology collective.	2015-09-18
8	7	Making Tech Spaces Safe for Diverse Faces	Technology events can be extremely empowering experiences for planners, speakers, and attendees. However, this empowerment is only fully experienced if you’re a straight, cis white male. For everyone else, there are limits to what can be gained from technology events. And for women, technology events present more than just unequal access to benefits: they can be dangerous spaces where harassment, assault, and even death are real threats.\\n\\nAs an African American male, I have experienced firsthand what it means to be a technology event attendee who is not a member of the dominant culture. Just this past September, I attended a prominent IT automation conference in San Francisco. Like most technology conferences I attend, I was one of a handful of people of color among the hundreds of conference attendees.\\n\\nWhile I have grown used to being part of a vastly underrepresented group at technology conferences, I had two experiences that reminded me that being a non-white male can result in being treated differently. First, while I was sitting in a session, another attendee (a white male) walked up to me, stopped a few feet away, looked at me for about three seconds, and then walked away without saying a word. It was as if he thought I was a Jabberwock and just wanted to make sure there wasn’t a Bandersnatch sitting next to me. Second, I was in line for a free book about writing classes for the IT automation tool for which the conference was named. One of the two white men handing out books asked me, “What classes do you plan to write?” Sensing my confusion when I hesitated (I thought it was an odd question to ask for a free book), he said, “We don’t have a lot of books left so we can only give them to people who will use them.” This made sense, but he didn’t ask the white male before me, nor the white male after me questions about how they would use the book. They received unquestioned access to their free copies.\\n\\n\nThe reasons why technology events have failed to equally share their benefits with women and minorities are many and varied. One culprit is hidden bias which is the “you’re not what I’m used to seeing” reason. Another reason is “brogrammer” culture, which preys on women by stripping them of their essential humanity and denying them any access to power. Unfortunately, this machismo attitude easily spreads from inside corporate walls to technology events.\\n\\nWe must examine the harmful outcomes that technology events foster: discrimination, aggression, and harassment. The only way to change these outcomes is to change behavior. I believe that there are three behaviors that need to be changed. They are how technology event planners use codes of conduct, discuss marginalized groups, and provide tools to help people who encounter aggression at technology events.\\n\\nCodes of Conduct\\n\\nCodes of conduct, in and of themselves, are useless. If the code of conduct is hidden somewhere on the conference web site and never referenced during the conference, then it presents no value. For a code of conduct to be effective, it has to have the right content, be used in the right conversations, and have the right level of enforcement capital.\\n\\nTechnology events should make sure that their codes of conduct describe both acceptable and unacceptable behaviors. They should also include contact information for reporting code of conduct violations and penalties for those who violate the code of conduct. It’s important that conference attendees know that the code of conduct is not just about their own individual behavior. Conference organizers should make sure that everyone feels empowered to report any violations that they observe whether against them or another attendee.\\n\\nEven a code of conduct with the right content is ineffective if it is never seen nor discussed. The first conversation that a technology event has with an attendee is the electronic exchange that happens during registration. Technology events must make acknowledgement of the code of conduct a required part of the registration process. Make registrants scroll to the end of the document and click a checkbox before they can complete their registration for the event. Furthermore, the code of conduct has to be prominently displayed in the conference guide. It also needs to be verbally reviewed on stage either right before or during the opening keynote. Given the immense amount of discrimination, microaggressions, and abuse at technology events, it’s impossible to spend too much time reinforcing the code of conduct and the intention to make the event safe and welcoming for everyone.\\n\\nTechnology event organizers also need to put some teeth into their codes of conduct by punishing those who violate it and, if necessary, the companies they represent. If the violation is egregious enough, then the individual should be banned from the event for multiple years. The worst offenses should result in the offender’s company being banned from the technology conference. If the person who violated the code of conduct is not a registered attendee, then that person should be placed on a problem-person list along with any publicly available personal information (i.e., name, online profile, picture, etc.). Conference personnel should be trained in how to identify, approach, and expel people on this list.\\n\\nOverrepresented Groups Should Not Speak for Marginalized Groups\\n\\nThe release of diversity data by Google in May 2014 resulted in a stream of diversity data from other large and well-known tech companies. It also resulted in more conversations about why women and minorities are so underrepresented. These are healthy conversations to have, but there is a real danger that any progress made in improving diversity will be undercut by those who jump on the bandwagon of diversity in order to advance their own interests. One way that diversity carpetbaggers are doing this is by speaking at technology events. This behavior usually presents itself as one or more white male “allies” who believe that they have the position and experience to discuss solving technology’s diversity problem.\\n\\nIf a technology event wants to address the lack of diversity in technology, then the speakers and panelists should be members of the groups that are underrepresented in technology. Having a group of white men talk about getting more women into tech, tout their “ally” status, or discuss strategies for addressing discrimination exacerbates the problem. It reinforces the belief that women and minorities are not qualified to tell their own stories or understand their own problems. It also communicates the falsehood that it takes a white man to solve the problems that women and minorities face in the technology industry. The lack of objectivity that white men have about the problems of their privilege is damaging to the conversation.\\n\\nTechnology event organizers should not give overrepresented groups a pedestal to discuss their privilege because they will always make the discussion about them. They will always try to talk over women and minorities, deny their privilege, and blame victims for not working hard enough in the very system that gives white men privilege. Instead, event organizers should seek members of underrepresented groups to speak on panels about their challenges. Since this often involves recounting painful experiences, event organizers should offer speaking training to potential speakers. Event organizers should also make every effort to meet with members of underrepresented groups to form relationships with them and assuage any concerns they may have about going public with their experiences.\\n\\nImplement a Panic System\\n\\nWomen especially are far too often on an uneven playing field at technology events: outnumbered and surrounded by men and often at a physical size and strength disadvantage relative to those who may assault them. The threats of bodily harm that technology events pose to women can be understood from even a cursory evaluation of what has happened just in 2014 as reported by sites like Geek Feminism Wiki. This year we saw reports of two women being groped at a Bitcoin meetup, a woman being sexually harassed at a Danish hacker space, and a woman being sexually harassed at OSCON. Keep in mind that these are just the incidents that get reported.\\n\\nWhile women are disproportionately targeted, members of all marginalized groups can face serious situations of abuse, assault, harassment and bullying at tech events. Technology events can mitigate these risks by implementing a panic system that can summon help whenever an attendee feels threatened. Ideally, a panic system provides assistance that prevents an incident from happening or results in early intervention. However, they can also be useful in helping victims of an attack get support as well as report details about what happened to them.\\n\\nSince microaggressions, abuse, and discrimination can be subtle and short in duration, having a panic system that is easy to use, private, and responsive can help cut through the confusion that often sets in after a confrontation. Since many survivors are in a state of shock after an incident, it’s vital that technology event organizers put a high degree of visibility on the existence and usage of their panic system. This can be done during the registration process where the event’s commitment to the safety of all attendees is stated and the panic system is described.\\n\\nAn effective technology event panic system will have three components: people, places, and push notifications. The “people” component consists of event personnel who are easily recognized as official staff members. This can be done by providing event personnel with a standard shirt style and identifying marks.\\n\\nThe “place” component consists of safe rooms where attendees can go and privately discuss any incidents. Safe rooms should be pointed out on maps of the event and marked with a sign outside of the door. These rooms should be available and staffed 24/hours a day for the duration of the event. However, please note that not all attendees will be comfortable approaching these spaces, and other ways of contacting organizers and setting up safe spaces to communicate must be facilitated.\\n\\nThe “push notification” component can be as simple as an email address (e.g., HelpMe@techevent.com) to which attendees can send messages after experiencing or witnessing an incident. During registration, attendees should have the ability to opt into the panic system and receive a confirmation email after doing so. Or, since many technology event attendees use Twitter, a Twitter account (e.g., @HelpMe_TechEvnt) can be provided. If attendees opt into a Twitter driven system, then they will receive a notification from Twitter once the conference panic system account starts following them. Once an attendee’s Twitter account is followed by the event’s panic system account, the attendee can direct message the event personnel monitoring the account in the event of a problem.\\n\\nHaving a email or Twitter driven push notification system allows calls for help to be done privately. This avoids the public shaming that many women endure when they accuse men of inappropriate behavior. Conference personnel who are assigned to monitor the panic system must make the preservation of the privacy of those who use it the highest priority. Regardless of the system used, all information provided to it must be quickly responded to by conference officials who are trained in dealing with harassment, assault, and even rape. Event organizers may need to procure training for their personnel to properly prepare them to deal with potentially traumatized victims.\\n\\nChanging Technology Events\\n\\nChanging technology events from experiences that are all too often filled with discrimination and danger to the empowering professional experiences that they should be will take time. However, strengthening and enforcing codes of conduct, intelligently and effectively discussing the plight of women and minorities in technology, and implementing a private and responsive panic system are low-cost behavioral changes that can go a long way toward improving technology events. These changes will help technology event attendees receive the open and safe environment they deserve and provide event organizers with the tools they need to maximize the experiences they create.	2014-10-30
9	8	How Tech Business Models Come From Marginalized Communities, But Startups Are Still Mostly White	During the past ten years, “startup” has become a buzzword in the world of business and technology. On one end of the spectrum sits the the promise of massive returns for initial investors and small core teams, and at the other end is the can’t-look-away-as-the-crash-is-happening horror stories of those who entered the startup game and failed. This public fascination has pushed into the limelight the founders and CEOs who run million-dollar tech corporations. Unlike the business leaders of earlier generations, these folks are made to seem just like the average joe. I mean, if you don’t take into the account the billion-dollar bank account, isn’t Mark Zuckerberg, in his t-shirt and jeans, just like you?\\n\\nThe answer, of course, is no, and journalists, tech leaders, teachers, and many others continue to point to this reality. In a January 2016 article, PRX Co-Founder and CEO Ricky Yean highlights poverty as a primary factor in access to startup success. He writes:\\n\\n“Being poor makes you suck at using money as a resource. My time was always cheaper growing up, so I’d rather spend time than spend money. I had to fix this when we raised our first seed round, but it took quite some time. A simple decision to hire, for example, took a very long time to the point that it cost us growth.”\\n\\nYean’s argument centers on his concept of “mindset inequality”: the internalized effects of systemic inequality that appear, for him, in the inability to ‘properly’ manage money, confidently pitch your startup, or compete in the highly competitive startup arena. While Yean makes an important intervention, his analysis reproduces particularly classist ideas about what it is to experience poverty in America, and struggles to interpret these experiences from an intersectional perspective. When, in particular, black women must navigate the ramifications of the stereotype of their loud, angry, and opinionated presence in White-dominated business spaces, then Yean’s explanation seems to miss the mark.\\n\\nWhat follows is not an argument against the reality of systemic inequality in America. It is not a disavowal of the multiple ways that people living in poverty do experience real disadvantages when it comes to accessing resources, education, jobs, and more. This is an effort to consider how representing startups as inherently incompatible with the experiences of marginalized peoples requires a purposeful omission. This silencing refuses the various ways these communities have actually built the economic models that are popularized by startups today, and serves to solidify a divide between economic success and the emotional/physical/intellectual labor of these groups.\\n\\nIf the labor of these seemingly incompatible communities — mostly communities of color, and women of color, particularly black women — rests at the foundation of the startup ecosystem, how does that require us to rethink startup spaces and what it means to promote diversity within them?\\n\\nRacial Capitalism\\n\\nThe history of 20th century entrepreneurship cannot be told without the history of racist exclusion from big business. The rise of industrialization and big business in the late 19th century continued the consolidation of power in businesses. Women of color were excluded, in many cases by law, from employment at the largest, wealthiest firms and industries in the country. As Mansel G. Blackford has argued, by the early 1900s, big businesses were run with few exceptions by white, educated, middle- and upper-class men. Women and people of color, excluded from opportunities at these firms, became entrepreneurs, often serving their communities in businesses and industries that white workers found undesirable. Even today, small business are still disproportionately owned by immigrants, and entrepreneurship was borne out of a need for economic survival.\\n\\nThe distinction drawn between small business owners and startup founders is, at best, tenuous. The enduring distinction ensures that we think of startups as separate from the contributions to entrepreneurship by women, people of color, and other intersecting identities. It simply isn’t accurate to say that marginalized communities have not developed and excelled in the world of profitable high growth and quickly scalable business. Instead, the social value of these businesses has been negated by the social value of the people who are connected to these ventures. Put another way: marginalized folks cannot be understood as producers of things of value and, instead, the experiences, culture, and often bodies of marginalized people circulate as objects of value.\\n\\nA useful term to unpack this is “racial capitalism”. Introduced by Nancy Leong, racial capitalism “is the process of an individual or group deriving value from the racial identity of another person.” This illustrates why many in tech are focused on “diversity initiatives” that improve their PR image, while erasing the present and current contributions of marginalized groups to tech and entrepreneurship. This erasure can take many forms – from the refusal to invest in startups led by black women, to a marked inattention to how they innovated startup business models in the first place.\\n\\nCase In Point: Crowdfunding\\n\\nCrowdfunding leverages the excitement and support of online donors to finance the development of a project. It’s one of the most popular models for today’s startup ventures to prove the viability of their product, and sites like Kickstarter, Indiegogo, and GoFundMe have popularized this method of securing startup capital. The term “online” seems to date the model to our contemporary period, but crowdfunding is anything but new.\\n\\nConsider the Rent Parties that took place in Harlem, New York throughout the 40s and 50s. In response to limited housing options and rent prices that were raised as a form of racial discrimination, Harlem inhabitants threw parties for their community. Charging a fee at the door, guests enjoyed food, music, and dancing, and the proceeds of the party went towards the host’s rent. Powerfully, these parties were often spaces that allowed black women to escape some of the financial and social constraints that hemmed in their daily lives. Put another way: these parties were not only a useful way to ensure the economic survival of black communities in New York, but, more specifically, opened up ways for black women to navigate the complex network of systemic constraints that required the parties themselves.\\n\\nIs it possible to call these Harlemites startup founders? That’s debatable, but is this model of securing capital markedly similar to what has led to the success of products like Pebble Time, Axent Wear Cat Headphones, or Oculus Rift? Yes, absolutely. As with any successful crowdfunding campaign, Rent Party hosts had to ensure frequent and targeted communication, community interest, and motivating rewards (band, food, dancing) for their supporters.\\n\\nThinking about the implications of this similarity points to an interesting discrepancy. How have we come to understand startups as places that are particularly exclusionary to particular types of people, when it is these same people who’ve deployed one of the most popular startup investment models long before the word “startup” was even invented?\\n\\nCase In Point: Lean Startup\\n\\nEric Ries proposed lean startup methodology in 2008. The practice centers around the idea that a successful startup will present their product to potential consumers early in the development process, incorporate customer feedback, and go to market with something that already has a base of customers and serves a very specific and data-verified customer need.\\n\\nCritical to the success of this idea is that the set of practices encourages an organization to go to market quickly and cheaply, and use the opportunity to learn what the customer wants in order to make a product that will be profitable.\\n\\nTurning to the archive of black entrepreneurship in the antebellum United States, I’m struck by the way this model echoes survival strategies of enslaved black people – particularly when it comes to the marked absence of capital on the path to business success. Writing on slave entrepreneurship, Dr. Juliet E. K. Walker asserts:\\n\\n“With few exceptions, most antebellum slave entrepreneurs, bondsmen who hired their own time had to rely on human capital resources in the initial development of their businesses. Their investment costs were ingenuity, energy, industriousness, resourcefulness, and formidable business acumen, particularly for those who established the more successful business enterprises.”\\n\\nIn the same way, today’s lean startup methodology works to transition the primary investment from capital to the contributions of customers. For the entrepreneur who was enslaved, the reality of racial violence required a new model that could survive the lack of initial capital investment. This ‘lean’ venture was a practice of survival and business success.\\n\\nGiven the lack of investment in businesses ventures that are led by people of color, these techniques are often required due to a lack of initial capital. Organizations that aren’t bolstered by financial support simply cannot afford to bring their product through multiple rounds of iteration before turning to their customers to confirm their value proposition. Outside of what might be called credible startup spaces, small neighborhood and community ventures rely on a lean startup methodology to support their businesses and were early adopters of this practice long before it became mainstream.\\n\\nConclusion\\n\\nThis exploration of the rich history of entrepreneurship in marginalized communities is not designed to further notions of value through the language of profit and market worth (these have been used before). Instead, this discussion is designed to rework an exclusionary distinction and highlight the value of this frequently forgotten labor.\\n\\nIt’s likely that the social value of the word startup will continue to grow, and we should pay close attention to which businesses receive the sought-after title. The word “startup” has surreptitiously begun to signify a particular brand of business success, and, not only this, a particular type of business person. There are, of course, exceptions to this trend, but the uncritical celebration of these success does not do away with the complicated reality.\\n\\nSomehow — despite the rich history of thrift, lean innovation, and financial pivoting that are everyday tactics of those who experience poverty, racialization, and the intersections of both — the narratives that circulate about startup businesses present these people as fundamentally incapable of success. Yet, it’s not that experiences of poverty or racialization make a person inherently unsuitable for success in startup environments. Instead, it’s how we come to value particular peoples and their experiences in hierarchical ways, that present some traits as singularly suitable for the startup space.	2016-02-22
10	8	Confronting the Assumption of Whiteness in Virtual Spaces	How are we designing virtual experiences and spaces in ways that uncritically privilege whiteness? In this article, I argue that the use of haptics in virtual spaces, the designs of “future” virtual reality interfaces, and the content being developed for the platform, reveal important assumptions about the end user which continue to privilege whiteness in our growing virtual communities.\\n\\nIn these contexts, the deeply complex workings of race are flattened through an investment in recreating the ‘real.’ Take, for example, the basic premise of haptic technology: it “enable[s] consumers to perceive touch sensations when using electronic devices. The touch sensation… makes a virtual experience seem more physical and realistic” (Immersion Corporation). What’s lost here are the various ways ‘realness’ is shaped through the deeply subjective experiences that form at the intersections of race, class, sexuality, ability, and more. I cannot help but wonder which, or perhaps more accurately whose, version of real may take precedent. When the white male is imagined as the end user of virtual technologies, this assumption shapes the types of experiences and interfaces that are designed, which in turn allows whiteness, and white maleness in particular, to continue to circulate as a type of neutral user experience.\\n\\nLet’s begin with thinking on what I mean when invoking whiteness. In a recent interview on whiteness in the Canadian academy featuring Dr. Malinda Smith, Dr. Annette Henry, and Dr. Sunera Thobani, Dr. Smith comments “[t]here is something about whiteness which leads people to think it’s invisible, it’s neutral, it’s objective”. Adding to this, I want to quote Dr. George Lipsitz, who argues:\\n\\n“More than the product of private prejudices, whiteness emerged as a relevant category in American life largely because of realities created by slavery and segregation, by immigration restriction and Indian policy, by conquest and colonialism. A fictive identity of ‘whiteness’ appeared in law as an abstraction, and it became actualized in everyday life in many ways. American economic and political life gave different racial groups unequal access to citizenship and property, while cultural practices including wild west shows, minstrel shows, racist images in advertising, and Hollywood films institutionalized racism by uniting ethnically diverse European-American audiences into an imagined community — one called into being through inscribed appeals to the solidarity of white supremacy.”\\n\\n— The Possessive Investment in Whiteness: Racialized Social Democracy and the ‘White’ Problem in American Studies\\n\\nWhen thinking on and addressing whiteness, I am engaging with not only the singular identity category, but the collection of social processes and systems that are deeply invested in systems of violence and exclusion. Importantly, even this is a fraught category wherein the inability to appropriately perform the hegemonic form results in various exclusions.\\n\\nWhiteness and VR – Haptics\\n\\nWhen we start to investigate how haptic experiences are envisioned in virtual spaces, we find that they rely on the assumption of white male positionality. These issues are highlighted by the AxonSuit and AxonStation developed by AxonVR. Likely the next step in virtual experiences, the AxonSuit, AxonSkin, AxonStation, and AxonSkeleton are designed to produce experiences of “full-body virtual reality that feels real.” Marketed as the “interface between your body and the virtual world,” these hardware and software systems work together to “create sensations ranging from the brush of a butterfly’s wings to the impact of a punch.” Unsurprisingly, it is a white male featured in each image on the site.\\n\\nThe assumption of whiteness shapes who we can imagine having access to these virtual experiences, and, therefore, how we imagine we must build these experiences so that the user is fully immersed. In favor of producing seamless immersive experiences, that are not complicated by our varying, racialized relationships to touch, we seem to be losing sight of the truly complex mechanisms that produce it. When touch is understood only as a tool to produce immersive experiences, we lose sight of the real context of engagement: the lived experiences of the gameplayer. Even in virtual spaces touch is not contextless, and, more to the point, its only context is not the game. In this way, we should take pause when we begin to discuss touch and haptic experiences as if they can produce some sort of neutral reality.\\n\\nAcknowledging the subjectivity of haptic technology brings up several questions:\\n\\n1. How will virtual realities positioned around the white male as end user erase the experiences of marginalized people?\\n\\n2. What assumptions about hardware and software design may result from these assumptions of whiteness?\\n\\n3. What are the implications of recreating racialized hierarchies and violences in virtual spaces? What does this tell us about the ‘future’ of these technologies?\\n\\n4. How are virtual spaces particularly prime for recreating racialized violence?\\n\\n5. What can we learn about whiteness by engaging with the ways it circulates in our virtual spaces?\\n\\nFailure to address these questions will have negative effects on those who are not understood as the imagined user (black people, women, people with disabilities, and even white people who do not perform the idealized expectations of whiteness), and recreate non-virtual violences in virtual spaces.\\n\\nWhiteness and VR – Design and Content\\n\\nIn a recent article, “The Race to Make Virtual Reality an (Actual) Business Reality,” Jeffrey M. O’Brien writes of his experiences at Stanford University’s virtual reality lab:\\n\\n“…I experience a series of demos that turn me — a forty-something, able-bodied white guy — into various form factors, including a black woman confronting an epithet-spewing racist on a city street and a disabled veteran without full use of his limbs. Clearly, [Jeremy] Bailenson [head of Stanford’s virtual reality lab] feels VR is great at fostering empathy.”\\n\\nO’Brien’s comments point to a larger trend in the virtual reality space, where the technology is positioned as an opportunity to facilitate interracial discussion of marginalization. Importantly, I’ve yet to come across a platform that is developing content where a racialized character is able to explore and experience whiteness in the way that O’Brien is able to put on the experiences of marginalized folks; whiteness itself remains not only the default, but goes unaddressed and uncritiqued.\\n\\nIn another example, the design of future virtual technologies points to a particular assumption about the end user. In an article titled “The Perfect VR Headset Is Actually Just a Hoodie,” Mark Wilson profiles the products of a design experiment run by the design firm Artefact. To the question “[w]hat could virtual reality be in another five years,” one featured design is Shadow, built “for a person seeking immersion.” The designs looks similar to a hoodie pulled over the user’s head with various systems built into the sleeves and an attached backpack. Importantly, this design makes a particular assumption about the ease with which a user is able to wear this gear while moving safely through the non-virtual world. Who is able to wear pulled-up hoodies without encountering violence? Once again, whiteness remains unaddressed and uncritiqued.\\n\\nImmersive Experiences – Complicating Subject vs. Object via Du Bois\\n\\n“By now you’ve probably heard the hype about the coming wave of virtual reality (VR) and the miracles that it can render in videogames, entertainment, and exploration. Interested in flying a Black Hawk helicopter over the Dubai skyline just after dawn? It can put you there. How about walking in Neil Armstrong’s footsteps on the moon, or on the summit of Mount Everest? Done and done.”\\n\\n— Jeffrey M. O’Brien, Fortune Magazine, “The Race to Make Virtual Reality an Actual (Business) Reality”\\n\\nFully immersing the user in these “special, intense experiences… things that are expensive, dangerous, counterproductive, or impossible,” as Stanford VR expert Jeremy Bailenson describes in the article, relies on a particular version of subjectivity, and it is my contention that this subjectivity is centered in whiteness.\\n\\nSupposedly, virtual and augmented realities move away from the distractions of game consoles and controllers in order to decrease the divide between the tech user (subject) and the character (object). Here, the subject is a neutral actor outside of the virtual space. It is the entry into this digital space that disrupts this stasis and requires the use of haptic and other technologies to return the subject position, which is therefore real.\\n\\nThis format makes a significant assumption about the user – that they understand themselves as a distinct subject that is separate from object. Importantly, sociologist and activist W.E.B Du Bois argues that, for black folks, this version of self doesn’t hold true, and he makes this claim through the theoretical invention of double consciousness. He writes in “The Souls of Black Folk”:\\n\\n“It is a peculiar sensation, this double-consciousness, this sense of always looking at one’s self through the eyes of others, of measuring one’s soul by the tape of a world that looks on in amused contempt and pity. One ever feels his two-ness, — an American, a Negro; two souls, two thoughts, two unreconciled strivings; two warring ideals in one dark body, whose dogged strength alone keeps it from being torn asunder.\\n\\nThe history of the American Negro is the history of this strife, — this longing to attain self-conscious manhood, to merge his double self into a better and truer self.”\\n\\nThrough double consciousness, Du Bois argues that the subject and object exist simultaneously in the experience of black americans, which means that the subject cannot be neutral in its lived experiences. To be a black American is to constantly grapple with the convergence of identity that is shaped through understanding oneself as a subject while simultaneously being made object through various exclusionary systems. In this way, the self does not come into formation as a fundamental subject that is isolated or removed from objecthood.\\n\\nBuilding this non-linear narrative into our user interfaces can make room for experiences that perhaps more accurately mirror life. With this type of subjectivity in mind, we may create virtual experiences that are purposefully disrupted – asking for consent to various haptic experiences; a narrative where the experiences of a marginalized person are not consumable, and therefore disrupt neutral whiteness. While these examples disrupt the idea of a fluid immersive experience, I’d argue that the idea of a fluid, immersive experience is itself built off of the expectation of whiteness that can move fluidly and undisrupted through the world. Remembering that marginalized peoples cannot often move this way, fundamentally requires new ways of producing ‘real’ virtual experiences.\\n\\nConclusion\\n\\nWhat does this all mean? Overall it means we should be paying careful attention to the ways in which whiteness continues to take precedent in virtual spaces. We must avoid thinking that this new virtual frontier is somehow separate from the violences and exclusions that shape the ‘outside world.’ We are building, designing, and crafting stories for virtual reality with specific expectations of the subject, but this is perhaps not an inclusive model. Paying close attention to the ways subjectivity is produced for marginalized peoples not only requires us to consider how we are prioritizing whiteness in virtual spaces, but forces us to acknowledge these realities in our non-virtual interactions.	2016-10-19
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: natalie
--

SELECT pg_catalog.setval('articles_id_seq', 10, true);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: natalie
--

COPY authors (id, name, bio) FROM stdin;
2	Aditya Mukerjee	Aditya is an entrepreneur, investor, and engineer based in New York City. He studied statistics at Columbia and computer science at Cornell, and spends his free time playing German-style board games and listening to embarrassing music.\\nAditya organizes Identity Hackers, a group for LGBTQ+ engineers in New York.
3	Alyx Baldwin	Alyx Baldwin is the co-founder, CTO of Kip and an award-winning designer + engineer in NYC. They love networks, artificial intelligence and cats.
4	Tilde Ann Thurium	Tilde Ann Thurium is an artist, engiqueer, and activist. In previous lives, they have done stints as a florist, a security guard, and a Human Resources wench. Currently, they are working on a project to visualize police violence against people of color in the United States.  In their spare time, they illustrate data structures and algorithms with acrylic paint.
5	Kortney Ziegler	Kortney Ryan Ziegler is an Oakland based award winning artist, writer, and the first person to hold the Ph.D. of African American Studies from Northwestern University. He is the director of the multiple award winning documentary, STILL BLACK: a portrait of black transmen, runs the GLAAD Media Award nominated blog at blackademic.com and was recently named one of the Top 40 Under 40 LGBT activists by The Advocate Magazine and #29 of the most influential African Americans of 2013 by TheRoot100. Dr. Ziegler is also the founder of Trans*H4CK, a Hackathon and speaker series that spotlights trans* created tech and startups.
6	Terry Burns	Terri‘s a product manager at Twitter and contributor at Forbes. When she’s not writing code, Terri likes tweeting, reading, and eating.
7	Anjuan Simmons	Anjuan has worked in software development from the database to the user interface for 20 years. His roles have included developer, infrastructure designer, production support lead, and software project manager. He has an undergraduate degree in electrical engineering from the University of Texas at Austin and an MBA from Texas A&M University. Anjuan is also an author, speaker, occasional user of Twitter, gadgician, and world traveler (six continents down, one more to go).\n\n
8	Kara Melton	Kara is a Master’s Candidate in the Department of Gender Studies at Queen’s University. She researches questions of racial progress and spends time thinking on community building, startups, tech and design, board games, and donuts.
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: natalie
--

SELECT pg_catalog.setval('authors_id_seq', 8, true);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: natalie
--

COPY cities (id, name, year_founded, province_id) FROM stdin;
8	Toronto	1793	14
9	Montreal	1642	15
10	Quebec	1763	15
11	Ottawa	1826	14
12	Vancouver	1886	21
13	Yellowknife	1934	20
14	Whitehorse	1898	23
15	Iqaluit	1942	27
17	Calgary	1875	24
18	Edmonton	1795	24
19	Regina	1882	25
20	Saskatoon	1883	25
21	Halifax	1749	18
22	Moncton	1766	17
23	Fredericton	1785	17
24	Charlottetown	1764	22
25	St. John's	1497	26
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: natalie
--

SELECT pg_catalog.setval('cities_id_seq', 25, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: natalie
--

COPY countries (id, name, year_founded, national_animal) FROM stdin;
1	Canada	1867	beaver
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: natalie
--

SELECT pg_catalog.setval('countries_id_seq', 1, true);


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: natalie
--

COPY persons (id, name, age, residence_id) FROM stdin;
1	Hubert Roberts	50	1
2	Anabel Grant	51	1
3	Destini Davis	37	2
4	Keenan Daugherty	37	3
5	Courtney Kutch	42	4
6	Arno Swift	42	4
7	Ashley Quitzon	18	4
8	Louie Hartmann MD	36	4
9	Mr. Sammie Schimmel	80	4
10	Mrs. Cynthia Corkery	39	5
11	Dr. Delphia Wisoky	30	5
12	Miss Delfina Cassin	22	6
13	Mrs. Hermann Lind	60	7
14	Mr. Diamond King	53	8
15	Onie Hagenes	39	8
16	Malvina King	28	9
17	Theo Wolff	27	9
18	Efren Collier	30	10
19	Edison Heaney	31	10
20	Miss Lemuel Vandervort	20	11
21	Mckayla Walker	20	11
22	Kayden Kuhn III	20	11
23	Arthur Rogahn	37	12
24	Karl Berge	32	12
25	Kameron Reilly	75	13
26	Myriam Goodwin Jr.	78	13
27	Favian Harvey	60	14
28	Rosella Nienow	49	15
29	Rhianna Hodkiewicz	32	15
30	Audreanne Runolfsson	18	15
31	Efrain Hoppe	19	16
32	Norval Parker	30	17
33	Lazaro West	35	18
34	Jedediah Deckow	35	18
35	Dr. Marisa Marquardt	40	19
36	Desiree Reichel	64	19
37	Finn Cremin	37	20
38	Korbin Walter V	31	21
39	Kyle Beier	38	21
41	Clementine Schimmel	38	23
42	Hailee Harris	42	23
43	Johann Glover	40	24
44	Gene Cartwright	40	25
45	Mozelle Tillman	38	25
46	Matteo Reilly PhD	28	25
47	Dr. Mitchel Mitchell	25	26
48	Miss Sedrick Koch	50	26
49	Francesco Terry III	47	27
50	Miss Sabrina Blick	46	27
51	Rowland Lebsack	99	27
52	Sandra Hyatt I	19	28
53	Miss Lilian Powlowski	21	29
54	Felix Haley	18	30
55	Laurel Aufderhar III	28	31
56	Alan Treutel	18	31
57	Easton McGlynn	57	32
58	Terence Trantow	50	33
59	Tyrique Kirlin	54	33
60	Georgianna DuBuque	50	34
61	Angelina Reichel	40	34
62	Emil Rolfson	74	36
63	Leopold Windler	32	37
64	Bud Shanahan	23	38
65	Mrs. Ervin Cole	26	38
66	Karine Cartwright	67	39
67	Miss Lorenza Simonis	60	40
68	Dr. Retta Kuhlman	63	40
69	Doris Bogan	48	41
70	Harry White	48	41
71	Annamarie Krajcik	41	42
72	Kathleen O'Kon	38	42
73	Irving Bernhard MD	30	43
74	Dangelo Howell DVM	41	42
75	Candace Bernhard PhD	41	44
76	Mr. Ron Davis	40	44
77	Adella Upton DDS	29	45
78	Alice Stamm	31	45
79	Charity Hodkiewicz	24	46
80	Constance Lockman	90	46
81	Enoch Cole	80	47
82	Miss Myrtice Mayert	77	47
83	Justine Reynolds	64	48
84	Cierra Rippin	57	49
85	Jayden Cole	37	49
86	Sheldon Kiehn DDS	33	50
87	Dr. Jan Reichel	39	50
88	Nikolas Hammes IV	52	51
89	Mr. Chelsey McKenzie	46	52
90	Ms. Bridgette Wolf	46	52
92	Lilliana Bayer	46	53
93	Eldridge Rolfson	41	54
95	Vaughn Waelchi	41	54
96	Uriah Willms	20	55
97	Reid Smitham	20	55
98	Kayley Brakus	18	56
99	Daren Nicolas	70	57
100	Rudolph Doyle III	70	57
101	Raegan Olson	50	58
102	Everardo Dickens	60	59
103	Guido Reichel	60	59
\.


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: natalie
--

SELECT pg_catalog.setval('persons_id_seq', 104, true);


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: natalie
--

COPY provinces (id, name, year_founded, country_id) FROM stdin;
14	Ontario	1867	1
15	Quebec	1867	1
16	New Brunswick	1867	1
17	New Brunswick	1867	1
18	Nova Scotia	1867	1
19	Manitoba	1870	1
20	Northwest Territories	1870	1
21	British Columbia	1871	1
22	Prince Edward Island	1873	1
23	Yukon Territory	1898	1
24	Alberta	1905	1
25	Saskatchewan	1905	1
26	Newfoundland and Labrador	1949	1
27	Nunavut	1999	1
\.


--
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: natalie
--

SELECT pg_catalog.setval('provinces_id_seq', 27, true);


--
-- Data for Name: residences; Type: TABLE DATA; Schema: public; Owner: natalie
--

COPY residences (id, address, year_built, city_id) FROM stdin;
1	358 Deven Pines	1955	8
2	537 Wyman Harbors	1975	8
3	27475 Vallie Pike	1966	9
4	2230 Brett Shoal	1997	9
5	80053 Nikolaus Square	1940	9
6	71136 Howell Plain	1940	10
7	9635 Kozey Junction	1987	10
8	6333 Aida Wall	1900	11
9	4740 McDermott Street	1923	11
10	8779 Lonny Heights	1976	12
11	37768 HeathCote Fort	2000	12
12	9765 Theresia Brook	2013	12
13	329 Turner Divide	2016	13
14	13269 Aimee Way	2000	13
15	907 Rogahn Course	1944	13
16	7073 Karianne Branch	1944	14
17	2229 Karl Ridge	1975	14
18	5600 Hilpert Cliff	1977	14
19	3004 Mills Squares	1977	15
20	11323 Runte Ramp	1950	15
21	340 Kuvalis Crescent	1958	15
23	340 Kuvalis Crescent	1960	17
24	739 Koby Terrace	1960	17
25	7502 Kolby Key	1969	17
26	757 Crooks Fall	1999	17
27	1718 Dickinson Island	1999	18
28	396 Karine Junctions	1984	18
29	4500 Lorenza Cove	1984	18
30	3819 Runte Mews	1980	19
31	80992 Imani Dam	1920	19
32	2239 Bins Forks	1950	19
33	24688 Tremblay Village	1950	20
34	86960 Rocio Court	1951	20
35	721 Stamm Manor	1990	20
36	53458 Nicolas Fort	1990	20
37	506 Bashirian Junctions	1976	20
38	43697 Carter Lights	1971	21
39	736 Jenkins Club	1987	21
40	70030 Declan Brook	1944	21
41	759 Tressa Lakes	1959	21
42	3435 Eliseo Fort	1959	22
43	64020 Abbott Mill	1958	22
44	2575 Keaton Manor	1978	22
45	981 Alisa Turnpike	2010	22
46	15707 Elvera Crossing	2010	22
47	8964 Haleigh Rapid	2011	22
48	203 Klocko Squares	1993	23
49	3199 Schmeler Port	1998	23
50	2147 Verla Street	1988	23
51	66319 Bernhard Burg	1989	23
52	89705 Henri Lights	1970	23
53	"860 Pagac Burgs	1970	24
54	6314 Cruickshank Freeway	1971	24
55	319 Colt Center	1965	24
56	87257 Jacobson Brook	1965	25
57	7829 Connelly View	1964	25
58	82172 Anibal Station	1996	25
59	175 Howe Valley	2004	25
\.


--
-- Name: residences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: natalie
--

SELECT pg_catalog.setval('residences_id_seq', 59, true);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: residences residences_pkey; Type: CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY residences
    ADD CONSTRAINT residences_pkey PRIMARY KEY (id);


--
-- Name: articles articles_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_author_id_fkey FOREIGN KEY (author_id) REFERENCES authors(id);


--
-- Name: cities cities_province_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_province_id_fkey FOREIGN KEY (province_id) REFERENCES provinces(id);


--
-- Name: persons persons_residence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY persons
    ADD CONSTRAINT persons_residence_id_fkey FOREIGN KEY (residence_id) REFERENCES residences(id);


--
-- Name: provinces provinces_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY provinces
    ADD CONSTRAINT provinces_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: residences residences_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: natalie
--

ALTER TABLE ONLY residences
    ADD CONSTRAINT residences_city_id_fkey FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- PostgreSQL database dump complete
--

