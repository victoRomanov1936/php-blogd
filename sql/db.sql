CREATE DATABASE blog;

CREATE TABLE `articles` (
                        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                        `title` varchar(255) NOT NULL,
                        `url` varchar(255) NOT NULL,
                        `image_path` varchar(255) DEFAULT NULL,
                        `content` text,
                        `date` datetime NOT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comments` (
                            `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) NOT NULL,
                            `id_art` int(10) unsigned NOT NULL,
                            `image_path` varchar(255) DEFAULT NULL,
                            `content` text,
                            `date` datetime NOT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO articles (title, url, image_path,content, date) VALUES ('Four post', 'four-post', 'https://dummyimage.com/800x400/89a0a1/ffffff','It has long been found that when evaluating design and composition, readable text makes it difficult to concentrate. Lorem Ipsum is used because it provides more or less standard template padding, as well as actual distribution of letters and spaces in paragraphs, which is not obtained by simply duplicating "Here is your text.. Here is your text.. Here is your text.." Many web page layout programs and HTML editors use Lorem Ipsum as their default text, so a search for the keyword "lorem ipsum" immediately reveals how many web pages are still waiting to be born. Over the years, the text of Lorem Ipsum has received many versions. Some versions appeared by mistake, some - intentionally (for example, humorous versions). ', '2020-12-09 12:00:00');

INSERT INTO comments (name, id_art, image_path,content, date) VALUES ('Bynkertav', 3 , 'https://dummyimage.com/200x200/89a0a1/ffffff','Lorem Ipsum is fish text often used in print and web design. Lorem Ipsum has been the standard "fish" for Latin texts since the early 16th century. At the time, an unnamed printer created a large collection of font sizes and shapes, using Lorem Ipsum to print samples. Lorem Ipsum not only successfully survived five centuries without noticeable changes, but also stepped into electronic design. It has been popularized in modern times by the publication of Letraset sheets with Lorem Ipsum patterns in the 60s and, more recently, by layout programs such as Aldus PageMaker, which use Lorem Ipsum in their templates. ', '2020-12-09 12:00:00');
