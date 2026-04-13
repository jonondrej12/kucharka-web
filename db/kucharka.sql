-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 13. dub 2026, 09:34
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `kucharka`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`) VALUES
(1, 'Polévky', '🍲'),
(2, 'Dezerty', '🍰'),
(3, 'Hlavní jídla', '🍕'),
(4, 'Svačiny', '🥨'),
(5, 'Saláty', '🥗');

-- --------------------------------------------------------

--
-- Struktura tabulky `recipes`
--

CREATE TABLE `recipes` (
  `name` varchar(255) NOT NULL,
  `ingredients` text NOT NULL,
  `process` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `created` date NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `recipes`
--

INSERT INTO `recipes` (`name`, `ingredients`, `process`, `author`, `created`, `id`) VALUES
('Jarní hrášková polévka s vaječnou zavářkou ', '1 l zeleninového vývaru\r\n2 vejce\r\n100 g mraženého hrášku\r\n1 lžíce dětské krupičky\r\n1 snítka petrželky\r\n2 lžíce másla\r\nsůl\r\nmletý pepř\r\n', 'Máslo pomalu rozehřejeme v kastrůlku. Přilijeme dvě rozklepnutá a rozmíchaná vejce.\r\n\r\nZlehka promícháme. Jakmile se vajíčka v kastrůlku začnou srážet, posypeme je krupičkou a vše dobře promícháme.\r\n\r\nMíchaná vajíčka s krupičkou zalijeme vývarem a přivedeme k varu. Do vroucí polévky přidáme hrášek.\r\n\r\nPolévku důkladně zamícháme a necháme asi 5-10 minut povařit.\r\n\r\nPřed koncem vaření do polévky přidáme nasekanou petrželku a odstavíme.\r\n\r\nPolévku podáváme samotnou nebo s čerstvým pečivem.\r\n', 'alfons', '2026-03-29', 3),
('Tradiční bramboračka podle Dity P', '2 hrst sušené houby\r\n4 ks brambory\r\n2 ks mrkev\r\n1 ks celer oloupaný a přepůlený\r\n1 ks cibule\r\npetržel oloupaná a nakrájená nadrobno\r\nsůl\r\npepř mletý\r\n1 ks knorr bohatý bujon zeleninový nemusí být\r\n50g máslo\r\n50g mouka\r\nmajoránka podle chuti\r\n2 stroužek česnek\r\n1 ks vejce\r\npetržel čerstvá\r\n', 'Houby dám do kastrůlku, zaliju asi půllitrem vody a nechám chvíli povařit. Do velkého hrnce dám vařit všechnu zeleninu a 1,5 litru vody. Přidám předvařené sušené houby i s vodou, ve které se vařily, a bujon.\r\n\r\nNechám vařit tak čtvrt hodiny a mezitím si udělám jíšku – rozehřeju v kastrůlku máslo, přidám mouku a míchám dozlatova. Ještě horkou jíšku vliju do vařící polévky, osolím, opepřím a přidám majoránku.\r\n\r\nNakonec vyndám z polévky celer, cibuli i celou mrkev. Přidám prolisovaný česnek a do bramboračky přes vidličku rozklepnu vejce. Přidám hrstku čerstvé petrželky a je hotovo.\r\n', 'alfons', '2026-04-02', 4),
('Smetanový hrášek s fašírkou', '7 lžíce smetana\r\n1 balení zakysaná smetana\r\n1 lžíce ocet\r\n1 stroužek česnek\r\n1ks cibule\r\n10g petržel\r\n2 ks vejce\r\n2 ks houska\r\n2 lžíce strouhanka\r\n2 lžička vegeta\r\n3 lžíce cukr\r\n3 lžička mletá paprika\r\n300g hrášek mražený\r\n5 lžíce olej arašídový\r\n500g mleté maso - vepřové\r\n7 lžíce polohrubá mouka\r\n\r\nPodle chuti\r\npepř mletý\r\nsůl\r\n\r\n', 'Příprava omáčky: Cibuli oloupejte, nakrájejte a rozdělte na dvě poloviny. V hrnci rozehřejte olej. Přidejte jednu polovinu cibule, zpěňte ji a ochuťte paprikou. Vsypte hrášek a vše zalijte vodou. Nechte asi 15 minut vařit. Poté omáčku dochuťte vegetou, octem, cukrem. Osolte a opepřete. Promíchejte. V míse smíchejte zakysanou smetanu se smetanou na vaření. Postupně přimíchejte mouku. Vzniklou směs nalijte do hrnce s hráškem, promíchejte a nechte 10 minut povařit. Podle hustoty můžete přidat trochu smetany s moukou, podle chuti můžete omáčku dosladit nebo naopak přidat ocet.\r\n\r\nPříprava fašírky (masových koulí): Starší pečivo namočte do vody. Česnek oloupejte a propasírujte. V míse smíchejte mleté maso a vyždímané pečivo. Přidejte druhou půlku nasekané cibule, česnek, vegetu, mletou papriku a strouhanku. Přidejte 4-5 lžic polohrubé mouky, vejce a nasekanou petrželku. Osolte, opepřete a dobře promíchejte, aby vám vznikla konzistentní hmota. V pánvi rozpalte dostatek oleje. Z hmoty vytvořte kuličky velikosti dlaně, které v oleji osmažte. Fašírky pak podávejte s hrachovou omáčkou.\r\n\r\n\"Recept pro vás připravil známý italský kuchař Emanuel Ridi\"\r\n', 'alfons', '2026-04-02', 5),
('Bylinkové máslo s medvědím česnekem', '250g máslo\r\n1 lžíce smetana ke šlehání\r\n1 hrst medvědí česnek jemně nasekaný, může být i mražený\r\n1 lžíce tymián jemně nasekaný\r\n1 lžíce šalvěj jemně nasekaná\r\n1hrst pažitka jemně nasekaná\r\npepř mletý\r\nsůl\r\n', 'Změklé máslo rozmixujte se smetanou na hladký krém.\r\n\r\nOprané a osušené listy medvědího česneku nasekejte najemno (nebo lehce rozmixujte, ale pozor, aby z nich nebyla kaše). Stejně tak nasekejte nebo rozmixujte tymián, šalvěj a pažitku. Vše přidejte k máslu, osolte, opepřete a dobře promíchejte.\r\n\r\nHmotu rozdělte na poloviny nebo třetiny, každou část dejte na kus fólie nebo alobalu, s její pomocí vytvarujte válečky a uložte je do ledničky. ', 'alfons', '2026-04-02', 6),
('Mrkvový dort se sýrovým krémem', '250\r\ng hladká mouka\r\n2\r\nlžička prášek do pečiva\r\n1 lžička jedlá soda\r\n1,50 lžička skořice - mletá\r\n0,50 lžička zázvor - mletý\r\n0,25 lžička muškátový oříšek\r\n1 špetka sůl\r\n180 ml rostlinný olej\r\n4 ks vejce\r\n180g třtinový cukr\r\n70g cukr krupice\r\n120g jablečné pyré\r\n1lžička vanilkový extrakt\r\n300g mrkev jemně nastrouhaná\r\nvlašské ořechy na posypání\r\n\r\nKrém:\r\n150g moučkový cukr\r\n250g smetanový sýr Philadelphia, Lučina...\r\n120g máslo změklé\r\n1 lžička vanilkový extrakt\r\n\r\n', 'V míse smíchejte suché suroviny - mouku, prášek do pečiva, jedlou sodu, koření a sůl. V další míse promíchejte vejce, olej, oba cukry, jablečné pyré a vanilkový extrakt. Nakonec vmíchejte jemně nastrouhanou mrkev, pak přidejte směs suchých surovin a umíchejte hladké těsto.\r\n\r\nDortovou formu o průměru 20 cm vyložte papírem na pečení (nebo vymažte tukem a vysypte moukou). Nalijte do ní připravené těsto a pečte v troubě předehřáté na 170 °C stupňů (dolní a horní ohřev) cca 55 minut. Propečenost otestujte zapíchnutím špejle do středu těsta. Po vytažení by měla špejle zůstat suchá, těsto se na ni nesmí lepit. Pokud by dort během pečení rychle tmavl a nebyl ještě uvnitř propečený, zakryjte ho alobalem.\r\n\r\nNež se dort upeče, připravte krém. V míse prošlehejte změklé máslo (musí být opravdu měkké, aby v krému nebyly hrudky), moučkový cukr, vanilkový extrakt a čerstvý sýr.\r\n\r\nUpečený korpus nechte zcela vychladnout a poté ho rozkrojte podélně na dvě poloviny. Spodní část potřete krémem, zakryjte vrchní částí a celý dort ještě potřete zbytkem krému. Po obvodu ho ozdobte nasekanými vlašskými ořechy a nechte nechte několik hodin (ideálně přes noc) odpočinout v lednici.\r\n', 'alfons', '2026-04-02', 7),
('Ševcovský salát', '\r\n2\r\nlžíce kečup - ostrý\r\n2\r\nlžíce hořčice plnotučná\r\n2\r\nlžíce worcestrová omáčka\r\n5\r\nrostlinný olej\r\n1\r\nkg buřty\r\n1\r\ncibule\r\n1\r\nnakládané okurky\r\n200\r\ng majonéza\r\nsůl\r\npepř mletý\r\n', 'Kečup, hořčici, worchestr, olej svaříme na omáčku a dáme stranou buřty, cibuli a okurku nakrájíme na nudličky a smícháme s uvařenou omáčkou, přidáme majonézu a dle chuti sůl a pepř. Necháme v lednici nejméně 2 dny odležet, podáme s chlebem a pečivem.\r\n\r\nJe to výborné letní papání k pivu.\r\n', 'alfons', '2026-04-02', 8),
('Celerová polévka s modrým sýrem', '1 ks celer větší\r\n2 ks brambory\r\n1 lžíce řepkový olej\r\n1 ks cibule\r\n1,50 l zeleninový vývar\r\n1 ks řapíkatý celer (stvol)\r\n1 lžička muškátový květ\r\n1 lžička kmín\r\nsůl\r\npepř mletý\r\nsemínka mix (k podávání)\r\nsýr modrý (k podávání)', 'Na oleji orestujte najemno nakrájenou cibuli, přidejte nahrubo nastrouhaný celer a na menší kousky nakrájené brambory. Zalijte vývarem, okořeňte kmínem a muškátem, osolte a opepřete.\r\n\r\nAsi po 10 minutách přidejte na kousky nakrájený řapíkatý celer a nechte ještě 5 minut vařit. Odstavte a rozmixujte na hladký krém. Ozdobte celerovou natí, mixem semínek a rozdrobeným modrým sýrem.\r\n', 'alfons', '2026-04-02', 9),
('Květákový krém s parmazánem', '1 ks květák menší\r\n2 lžíce ghí\r\n1 ks cibule\r\n2 stroužek česnek\r\n1 ks brambory větší\r\n800 ml vývar zeleninový nebo kuřecí\r\n100 ml smetana ke šlehání\r\n60 g strouhaný parmazán\r\nmuškátový oříšek\r\npepř mletý\r\nsůl\r\nolivový olej na pokapání', 'Květák rozeberte na růžičky a omyjte.\r\n\r\nV hrnci rozehřejte ghí. Přidejte nadrobno nakrájenou cibuli a nasekaný česnek a za stálého míchání je nechte zesklovatět. Přidejte růžičky květáku, na kostičky nakrájený brambor, promíchejte a zalijte vývarem. Osolte a vařte doměkka.\r\n\r\nPolévku rozmixujte tyčovým mixérem na hladký krém. Vmíchejte do něj smetanu a nastrouhaný parmazán a dochuťte solí, pepřem a špetkou muškátového oříšku. Při podávání můžete každou porci pokapat olivovým olejem. ', 'alfons', '2026-04-02', 10),
('Bramboračka s pórkem', '1 ks pórek\r\n250 g brambory\r\n25 g máslo\r\n1 lžíce olej\r\n1 kostka knorr bohatý bujon zeleninový\r\n300 ml mléko\r\n150 g tavený sýr\r\n1 lžička kmín\r\nsůl podle chuti\r\n1 hrst bylinky', 'Pórek očistíte, brambory oloupete a oboje nakrájíte na malé kousky. V hrnci rozehřejete máslo spolu s olejem, přidáte nakrájený pórek, brambory, kmín a krátce podusíte. Vše zalijete vývarem a vaříte asi 20 minut, dokud nejsou brambory měkké.\r\n\r\nV menším hrnci necháte v mléce ohřát a rozpustit sýr. Vlijete do polévky a podle chuti dosolíte.\r\n\r\nNa závěr polévku posypete bylinkami např. pažitkou či petrželkou.\r\n', 'alfons', '2026-04-02', 11),
('Jihočeská kulajda podle časopisu F.O.O.D.', '2 hrst sušené houby\r\n400 g brambory typ B\r\n750 ml vývar zeleninový\r\n4 ks vejce\r\n1 lžíce máslo\r\n3 lžíce hladká mouka\r\n3 ks bobkový list\r\n5 ks nové koření\r\n5 ks pepř celý\r\n250 ml smetana 30%\r\n1 hrst kopr nasekaný\r\n2 lžíce cukr krupicový\r\n2 lžíce ocet\r\nsůl a pepř', 'Houby dejte do misky a zalijte je horkou vodou. Oloupejte brambory a nakrájejte je na kostičky. V rendlíku přiveďte k varu vodu, dejte do ní vejce a vařte 8 minut. Poté je zchlaďte v ledové vodě a oloupejte.\r\n\r\nV hrnci rozpusťte máslo, zaprašte ho moukou a umíchejte jíšku. Zalijte ji vývarem, přidejte vodu z hub a metličkou vše dobře rozmíchejte, aby se jíška rovnoměrně rozpustila. Přidejte brambory, houby a koření, přiveďte k varu a vařte na mírném plameni, dokud nejsou brambory takřka hotové.\r\n\r\nVlijte smetanu, polévku ochuťte solí a pepřem, přidejte většinu nasekaného kopru. Už nevařte a chuť dolaďte cukrem a octem, dochucujte postupně podle toho, jak kyselou polévku máte rádi. Tu nalijte do talířů, přidejte vejce a zbylý kopr.\r\n\r\nRecept pro vás připravil časopis F.O.O.D. ', 'alfons', '2026-04-02', 12),
('Letní rybí polévka', '600 g ryby odřezky (kapr, pstruh, candát)\r\n1 ks mrkev\r\n1 ks petržel\r\n2 ks rajčata\r\n2 ks cibule\r\n5 stonek řapíkatý celer\r\n2 ks filety ze pstruha nebo sivena\r\n3 stroužek česnek\r\n2 lžička paprika sladká\r\n1 plechovka rajčata oloupaná krájená\r\nsůl a pepř\r\n1 hrst petrželka nasekaná a kváskový chléb k podávání', 'Připravte vývar. Odřezky ryb dejte do hrnce, přidejte překrojenou mrkev a petržel, rozpůlená rajčata, jednu překrojenou cibuli a 2 stonky řapíkatého celeru, zalijte vodou a vařte na mírném plameni asi 45 minut. Na posledních 10 minut přidejte do vývaru filety. Poté vývar slijte přes hustý cedník, zeleninu i zbytky ryb vyhoďte, už svou roli splnily, z filetů oberte kousky masa, odstraňte kůži a kosti.\r\n\r\nNež se uvaří vývar, pokrájejte zbylou zeleninu: cibuli a česnek nadrobno, řapíkatý celer na plátky, papriky na nudličky. Ve větším hrnci rozehřejte dvě lžíce oleje, orestujte cibuli, asi 3 minuty. Přidejte řapíkatý celer, po dvou minutách papriky a česnek. Restujte další dvě minuty, přisypte sladkou papriku, minutu ji restujte, jen aby se rozvoněla, a vlijte rajčata. Vše zalijte asi 0,75 l vývaru, přiveďte k varu a na mírném plameni vařte asi 15 minut.\r\n\r\nDo polévky dejte kousky rybího masa a dochuťte ji solí a pepřem. Nalijte do misek, přidejte nasekanou petrželku a podávejte s kváskovým chlebem.\r\n\r\nRecept pro vás připravil časopis F.O.O.D. ', 'alfons', '2026-04-02', 13),
('Chřestová polévka s pestem', 'svazek bílý chřest\r\n750 ml zeleninový vývar\r\n1 ks cibule\r\n2 lžíce máslo\r\n1 hrst mandlové lupínky\r\n150 ml smetana 30%\r\nsůl a pepř\r\n\r\nPesto\r\n4 ks mladý zelený chřest\r\n1 stroužek česnek\r\n3 lžíce mandle mleté\r\n70 ml olivový olej -100 ml\r\nsůl a pepř', 'Odlomte dřevnaté konce bílého i zeleného chřestu, přidejte je do hotového vývaru a asi 15 minut povařte. Vývar bude mít intenzivnější chřestovou chuť. Bílý chřest oloupejte (nemusíte nijak zvlášť pečlivě), slupky také přidejte do vývaru.\r\n\r\nPřipravte pesto. Zelený chřest pokrájejte na kousky asi 2 cm velké, dejte do hrnce s vroucí vodou, 2 minuty povařte, sceďte a zchlaďte proudem ledové vody. Osušte papírovou utěrkou, dejte do mixéru, přidejte ostatní suroviny a rozmixujte. Konzistenci upravte množstvím oleje.\r\n\r\nCibuli nasekejte nadrobno a zpěňte ji na másle. Na mírném plamenu restujte asi 3 minuty. Chřest pokrájejte na kousky asi 1–2 cm silné a přidejte je do hrnce. Zalijte scezeným vývarem a vařte, dokud chřest zcela nezměkne, asi 10 minut. Mezitím nasucho opražte mandlové plátky.\r\n\r\nPolévku rozmixujte dohladka, vmíchejte smetanu, už jen prohřejte a dochuťte solí a pepřem. Nalijte do misek, přidejte pesto, mandle a pár kapek oleje.\r\n\r\nRecept pro vás připravil časopis F.O.O.D. ', 'alfons', '2026-04-02', 14),
('polevka', 'polevka', 'l', 'alfons', '2026-04-02', 15),
('Jarní zeleninová polévka', 'f', 'f', 'alfons', '2026-04-02', 16),
('Zeleninová polévka s fazolkami', 'g', 'd', 'alfons', '2026-04-02', 17);

-- --------------------------------------------------------

--
-- Struktura tabulky `recipe_category`
--

CREATE TABLE `recipe_category` (
  `recipe_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `recipe_category`
--

INSERT INTO `recipe_category` (`recipe_id`, `category_id`) VALUES
(3, 1),
(3, 3),
(4, 1),
(4, 3),
(5, 1),
(6, 4),
(7, 2),
(8, 5),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('alfons', '$2y$10$9tSaQ8A2WvfqK3tBxhgj3e3Af8sgJFkfOp101oyWH4CtF2FszImTy'),
('user21', '$2y$10$32v6ji9GTqU0OQor8l43jOqRFucYSvuUEttyfsOThB/Us8FTZgu0G'),
('user22', '$2y$10$laAPiNCvMERdCBrDpTftdOwIPg8/GGu1hB1IFAKEoN3iVkoMvhkUS'),
('user23', '$2y$10$oL7A1e/pGpuQJUzew3ZS.uLNqgWsU7JeuT9OBj7ytm7wI7NUyAEs.'),
('user24', '$2y$10$f3RdSj/kQG6CBcyjgU/mnO72v15cFLSLfTSHN8grBz5hpFnRT68CC');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexy pro tabulku `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD KEY `fk_category` (`category_id`),
  ADD KEY `fk_recipe` (`recipe_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `fk_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
