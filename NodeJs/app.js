const express = require("express");
const path = require("path");
const cors = require("cors");
const { MongoClient } = require("mongodb");

const app = express();


// Middleware
app.use(cors());
app.use(express.json());  // To parse JSON request bodies
app.use(express.static(path.join(__dirname, "public-flutter")));




const featuredNewsRawData = [
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/spacejam.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/spacejam.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
    {
      title: 'ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ ᠨᠢᠭᠡ ᠮᠤᠩᠭᠤᠯ ᠬᠤᠶᠠᠷ ᠮᠤᠩᠭᠤᠯ',
      photo: 'assets/images/green knight.jpg',
      description: 'Black Widow has faced down mad titans and genocidal robots, but can the veteran Avenger take down a band of scrappy Looney Toon? It’ll be a showdown between Disney’s and Marvel’s “Black Widow” and the Warner Bros. sequel “Space Jam: A New Legacy” at the domestic box office, with Scarlett Johansson’s superhero adventure poised to reclaim the top spot. After “Black Widow” opened on July 9 to $80 million in North America, a record for COVID times, the comic book adaptation is projected to add $24 million to $28 million in its second weekend of release. Independent tracking services suggest that range is conservative and show the final weekend figure could reach $32 million through Sunday. A $30 million-plus haul in its second frame would be a decline on par with fellow Marvel standalone adventures such as 2018’s “Ant-Man and the Wasp” and 2017’s “Spider-Man: Homecoming,” which each dropped 60% from their initial weekends. It would also be a slight improvement on another pandemic-era release, Universal’s “Fast & Furious” sequel “F9,” which debuted to $60 million in June and plunged 67% in its sophomore outing. In a rare moment of streaming revenue transparency, Disney revealed last weekend that “Black Widow” collected $60 million globally on Disney Plus, where the film premiered (for a $30 surcharge) on the same day as its theatrical release. For now, Disney isn’t expected to update that figure beyond its opening weekend sales.',
      date: 'Jul 14, 2021',
      author: 'ᠵᠠᠷᠤᠳ ᠬᠦᠰᠡᠯᠡᠩ',
    },
  ]


const port = 3000; // Choose a suitable port number

// Replace the uri string with your connection string.
const uri = "mongodb+srv://mglhusileng:Saren13948156237@cluster0.l9437.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
            //  mongodb+srv://mglhusileng:Saren13948156237@cluster0.l9437.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0


// MongoDB Client
const client = new MongoClient(uri);

async function GetNews() {
  try {
    const database = client.db("NewsDatabase");
    const newsCollection = database.collection("NewsItems");

    const query = {};
    const options = {
      projection: { _id: 0, title: 1, description: 1, date: 1, author: 1, photo: 1 },
    };
    
    const newsCursor = newsCollection.find(query, options);
    const allDocuments = await newsCursor.toArray();
    
    console.log("Fetched News:", allDocuments);
    return allDocuments;
  } catch (err) {
    console.error("Error fetching news:", err);
    throw err;
  }
}

// MongoDB client
const AddNewsClient = new MongoClient(uri);
NewNews = []

// Route to add a new news item
app.post("/add-document", async (req, res) => {
  console.log("add news connected");
  console.log(req.body);
  const newDocument = req.body;
  try {
    const database = client.db("NewsDatabase");
    const newsCollection = database.collection("NewsItems");

    const result = await newsCollection.insertOne(newDocument);
    res.status(200).send({ message: "Document added successfully", result });
  } catch (error) {
    console.error("Error adding document:", error);
    res.status(500).send({ message: "Failed to add document", error });
  }
});



app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "public-flutter/index.html"));
});


// Route to fetch featured news
app.get("/api/featuredNews", async (req, res) => {
  try {
    const newsData = await GetNews();  // Wait for the news to be fetched
    res.json(newsData);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch news", error });
  }
});


// Start the server and connect to MongoDB
app.listen(port, async () => {
  try {
    await client.connect();  // Establish a connection to MongoDB
    GetNews();
    console.log(`Server is running on port ${port}`);
  } catch (err) {
    console.error("Failed to connect to MongoDB:", err);
  }
});

// Graceful shutdown
process.on("SIGINT", async () => {
  console.log("Closing MongoDB connection...");
  await client.close();
  process.exit();
});



// const books = [
//     {id: 1, title: 'Alice in Wonderland', author: 'Lewis Carrol'},
//     {id: 2, title: 'Around the World in eighty days', author: 'Jules Verne'},
//     {id: 3, title: 'Utopia', author: 'Sir Thomas Moor'},
//    ]
   
//    app.get('/api/books', (req, res) => {
//     res.json(books)
//    })


// const port = 3000
// app.get('/', (req, res) => {
//  res.send('Hello World!')
// })
// app.listen(port, () => {
//  console.log(`Server running at http://localhost:${port}`)
// })



// async function run() {
//   try {
//     const database = client.db('sample_mflix');
//     const movies = database.collection('movies');

//     // Query for a movie that has the title 'Back to the Future'
//     const query = { title: 'Back to the Future' };
//     const movie = await movies.findOne(query);

//     console.log(movie);
//   } finally {
//     // Ensures that the client will close when you finish/error
//     await client.close();
//   }
// }
// run().catch(console.dir);