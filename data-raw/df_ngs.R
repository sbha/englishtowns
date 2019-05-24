library(tidyverse)
library(rstrings)

# https://simple.wikipedia.org/wiki/List_of_cities_and_towns_in_England
# https://en.wikipedia.org/wiki/List_of_towns_and_villages_in_the_Republic_of_Ireland

english_towns <- "Abingdon, Accrington, Acton, Adlington, Alcester, Aldeburgh, Aldershot, Aldridge, Alford, Alfreton, Alnwick, Alsager, Alston, Alton, Altrincham, Amble, Amersham, Amesbury, Ampthill, Andover, Appleby-in-Westmorland, Arundel, Ashbourne, Ashburton, Ashby-de-la-Zouch, Ashford, Ashington, Ashton-in-Makerfield, Ashton-under-Lyne, Askern, Aspatria, Atherstone, Attleborough, Axbridge, Axminster, Aylesbury, Aylsham,
Bacup, Bakewell, Baldock, Banbury, Barking, Barnard Castle, Barnet, Barnoldswick, Barnsley, Barnstaple, Barnt Green, Barrow-in-Furness, Barton-upon-Humber, Barton-le-Clay, Basildon, Basingstoke, Bath, Batley, Battle, Bawtry, Beaconsfield, Beaminster, Bebington, Beccles, Bedale, Bedford, Bedlington, Bedworth, Beeston, Belper, Bentham, Berkhamsted, Berwick-upon-Tweed, Beverley, Bewdley, Bexhill-on-Sea, Bicester, Biddulph, Bideford, Biggleswade, Billericay, Bilston, Bingham, Birmingham, Bishop Auckland, Bishop's Castle, Bishop's Stortford, Bishop's Waltham, Blackburn, Blackpool, Blandford Forum, Bletchley, Blyth, Bodmin, Bognor Regis, Bollington, Bolsover, Bolton, Borehamwood, Boston, Bottesford, Bourne, Bournemouth, Brackley, Bracknell, Bradford, Bradford-on-Avon, Bradley Stoke, Bradninch, Braintree, Brentford, Brentwood, Bridgnorth, Bridgwater, Bridlington, Bridport, Brierley Hill, Brigg, Brighouse, Brightlingsea, Brighton, Bristol, Brixham, Broadstairs, Bromley, Bromsgrove, Bromyard, Brownhills, Buckfastleigh, Buckingham, Bude, Budleigh Salterton, Bungay, Buntingford, Burford, Burgess Hill, Burnham-on-Crouch, Burnham-on-Sea, Burnley, Burntwood, Burton Latimer, Burton-upon-Trent, Bury, Bury St Edmunds, Buxton, Blackburn,
Caistor, Calne, Camberley, Camborne, Cambridge, Camelford, Cannock, Canterbury, Carlisle, Carnforth, Carterton, Castle Cary, Castleford, Chadderton, Chagford, Chard, Charlbury, Chatham, Chatteris, Chelmsford, Cheltenham, Chesham, Cheshunt, Chester, Chesterfield, Chester-le-Street, Chichester, Chippenham, Chipping Campden, Chipping Norton, Chipping Ongar, Chipping Sodbury, Chorley, Christchurch, Church Stretton, Cinderford, Cirencester, Clacton-on-Sea, Cleckheaton, Cleethorpes, Clevedon, Cleveleys, Clitheroe, Clun, Coalville, Cockermouth, Coggeshall, Colchester, Coleford, Colne, Congleton, Conisbrough, Corbridge, Corby, Cotgrave, Coventry, Cowes, Cramlington, Cranfield, Crawley, Crayford, Crediton, Crewe, Crewkerne, Cromer, Crowborough, Crowle, Crowthorne, Croydon, Cuckfield, Cullompton, connor town,
Dagenham, Darley Dale, Darlington, Dartford, Dartmouth, Darwen, Daventry, Dawlish, Deal, Denton, Derby, Dereham, Desborough, Devizes, Dewsbury, Didcot, Dinnington, Diss, Doncaster, Dorchester, Dorking, Dover, Downham Market, Driffield, Dronfield, Droitwich Spa, Droylsden, Dudley, Dukinfield, Dunstable, Durham, Dursley,
Ealing, Earley, Easingwold, Eastbourne, East Grinstead, East Ham, Eastleigh, Eastwood, Edenbridge, Egham, Ellesmere, Ellesmere Port, Ely, Enfield, Epping, Epsom, Epworth, Erith, Esher, Eton, Evesham, Exeter, Exmouth, Eye,
Failsworth, Fairford, Fakenham, Falmouth, Fareham, Faringdon, Farnborough, Farnham, Farnworth, Faversham, Featherstone, Felixstowe, Fenny Stratford, Ferndown, Ferryhill, Filey, Filton, Fleet, Fleetwood, Flitwick, Folkestone, Fordingbridge, Fordwich, Fowey, Framlingham, Frinton-on-Sea, Frodsham, Frome,
Gainsborough, Gateshead, Gillingham, Gillingham, Glastonbury, Glossop, Gloucester, Godalming, Godmanchester, Goole, Gosport, Grange-over-Sands, Grantham, Gravesend, Grays, Great Dunmow, Great Torrington, Great Yarmouth, Grimsby, Guildford, Guisborough,
Hackney, Hadleigh, Hailsham, Halesworth, Halewood, Halifax, Halstead, Haltwhistle, Harlow, Harpenden, Harrogate, Harrow, Hartlepool, Harwich, Haslemere, Hastings, Hatfield, Havant, Haverhill, Hawley, Hayle, Haywards Heath, Heanor, Heathfield, Hebden Bridge, Hedon, Helston, Hemel Hempstead, Hemsworth, Henley-in-Arden, Henley-on-Thames, Hendon, Hereford, Herne Bay, Hertford, Hessle, Heswall, Hetton-le-Hole, Heywood, Hexham, Higham Ferrers, Highworth, High Wycombe, Hinckley, Hitchin, Hoddesdon, Holmfirth, Holsworthy, Honiton, Horley, Horncastle, Hornsea, Horsham, Horwich, Houghton-le-Spring, Hounslow, Hoylake, Hove Hucknall, Huddersfield, Hugh Town, Hull, Hungerford, Hunstanton, Huntingdon, Hyde, Hythe,
Ilchester, Ilford, Ilfracombe, Ilkeston, Ilkley, Ilminster, Ipswich, Irthlingborough, Ivybridge,
Jarrow,
Keighley, Kempston, Kendal, Kenilworth, Kesgrave, Keswick, Kettering, Keynsham, Kidderminster, Kidsgrove, Killingworth, Kimberley, Kingsbridge, King's Lynn, Kingston-upon-Hull, Kingston upon Thames, Kington, Kirkby, Kirkby Lonsdale, Kirkham, Knaresborough, Knottingley, Knutsford,
Lancaster, Launceston, Leatherhead, Leamington Spa, Lechlade, Ledbury, Leeds, Leek, Leicester, Leigh, Leighton Buzzard, Leiston, Leominster, Letchworth, Lewes, Lewisham, Leyland, Leyton, Lichfield, Lincoln, Liskeard, Littlehampton, Liverpool, Lizard, London, Long Eaton, Longridge, Looe, Lostwithiel, Loughborough, Loughton, Louth, Lowestoft, Ludlow, Luton, Lutterworth, Lydd, Lydney, Lyme Regis, Lymington, Lynton, Lytchett Minster, Lytham St Annes, Lofthouse,
Mablethorpe, Macclesfield, Maghull, Maidenhead, Maidstone, Maldon, Malmesbury, Maltby, Malton, Malvern, Manchester, Manningtree, Mansfield, March, Margate, Market Deeping, Market Drayton, Market Harborough, Market Rasen, Market Weighton, Marlborough, Marlow, Maryport, Marston Moretaine, Matlock, Melksham, Melton Mowbray, Mexborough, Middleham, Middlesbrough, Middleton, Middlewich, Midhurst, Midsomer Norton, Milton Keynes, Minehead, Morecambe, Moretonhampstead, Moreton-in-Marsh, Morley, Morpeth, Much Wenlock,
Nailsea, Nailsworth, Nantwich, Needham Market, Neston, Newark-on-Trent, Newbiggin-by-the-Sea, Newbury, Newcastle-under-Lyme, Newcastle upon Tyne, Newent, Newhaven, Newmarket, New Mills, New Milton, Newport, Newport, Shropshire, Newport Pagnell, Newquay, New Romney, Newton Abbot, Newton Aycliffe, Newton-le-Willows, Normanton, Northallerton, Northam, Northampton, North Walsham, Northwich, Norton Radstock, Norwich, Nottingham, Nuneaton,
Oakham, Okehampton, Oldbury, Oldham, Ollerton, Olney, Ormskirk, Orpington, Ossett, Oswestry, Otley, Ottery St Mary, Oundle, Oxford, Outwood,
Paddock Wood, Padstow, Paignton, Painswick, Peacehaven, Penistone, Penrith, Penryn, Penzance, Pershore, Peterborough, Peterlee, Petersfield, Petworth, Pickering, Plymouth, Pocklington, Pontefract, Polegate, Poltimore, Poole, Portishead, Portland, Portslade, Portsmouth, Potters Bar, Potton, Poulton-le-Fylde, Prescot, Preston, Princes Risborough, Prudhoe, Pudsey,
Queenborough, Quintrell Downs,
Ramsgate, Raunds, Rayleigh, Reading, Redcar, Redditch, Redhill, Redruth, Reigate, Retford, Richmond, Richmond-upon-Thames, Rickmansworth, Ringwood, Ripley, Ripon, Rochdale, Rochester, Rochford, Romford, Romsey, Ross-on-Wye, Rothbury, Rotherham, Rothwell, Rowley Regis, Royston, Rugby, Rugeley, Runcorn, Rushden, Rutland, Ryde, Rye,
Saffron Walden, St Albans, St Asaph, St Austell, St Blazey, St Columb Major, St Helens, St Ives, Cambridgeshire, St Ives, Cornwall, St Neots, Salcombe, Sale, Salford, Salisbury, Saltash, Saltburn-by-the-Sea, Sandbach, Sandhurst, Sandown, Sandwich, Sandy, Sawbridgeworth, Saxmundham, Scarborough, Scunthorpe, Seaford, Seaton, Sedgefield, Selby, Selsey, Settle, Sevenoaks, Shaftesbury, Shanklin, Sheerness, Sheffield, Shepshed, Shepton Mallet, Sherborne, Sheringham, Shildon, Shipston-on-Stour,Shiraz, Shoreham-by-Sea, Shrewsbury, Sidcup, Sidmouth, Sittingbourne, Skegness, Skelmersdale, Skipton, Sleaford, Slough, Smethwick, Snodland, Soham, Solihull, Somerton, Southall, Southam, Southampton, Southborough, Southend-on-Sea, South Molton, Southport, Southsea, South Shields, Southwell, Southwold, South Woodham Ferrers, Spalding, Spennymoor, Spilsby, Stafford, Staines, Stainforth, Stalybridge, Stamford, Stanley, Stapleford, Staunton, Staveley, Stevenage, Stockport, Stocksbridge, Stockton-on-Tees, Stoke-on-Trent, Stone, Stony Stratford, Stotfield, Stourbridge, Stourport-on-Severn, Stowmarket, Stow-on-the-Wold, Stratford-upon-Avon, Streatham, Street, Strood, Stroud, Sudbury, Sunderland, Sutton, Sutton Coldfield, Sutton-in-Ashfield, Swadlincote, Swaffham, Swanage, Swanley, Swindon, Swinton,
Tadcaster, Tadley, Tamworth, Taunton, Tavistock, Teignmouth, Telford, Tenbury Wells, Tenterden, Tetbury, Tewkesbury, Thame, Thatcham, Thaxted, Thetford, Thirsk, Thong, Thornaby, Thornbury, Thorne, Tickhill, Tilbury, Tipton, Tiverton, Todmorden, Tonbridge, Torpoint, Torquay, Totnes, Tottenham, Totton, Towcester, Tring, Trowbridge, Truro, Tunbridge Wells, Twickenham,
Uckfield, Ulverston, Uppingham, Upton-upon-Severn, Uttoxeter, Uxbridge,
Ventnor, Verwood,
Wadebridge, Wadhurst, Wakefield, Wallasey, Wallingford, Walmer, Walsall, Waltham Abbey, Waltham Cross, Walthamstow, Walton-on-Thames, Walton-on-the-Naze, Wandsworth, Wantage, Ware, Wareham, Warminster, Warwick, Washington, Watchet, Watford, Wath-upon-Dearne, Watton, Wednesbury, Wellingborough, Wellington, Wells, Wells-next-the-Sea, Welwyn Garden City, Wem, Wendover, West Bromwich, Westbury, Westerham, West Ham, Westhoughton, West Kirby, West Mersea, Westminster, Weston-super-Mare, Westward Ho!, Wetherby, Weybridge, Weymouth, Whaley Bridge, Whiston, Whitby, Whitchurch, Whitehaven, Whitley Bay, Whitnash, Whitstable, Whitworth, Wickford, Widnes, Wigan, Wigston, Willenhall, Wimbledon, Wimborne Minster, Wincanton, Winchcombe, Winchelsea, Winchester, Windermere, Winsford, Winslow, Wisbech, Witham, Withernsea, Witney, Wivenhoe, Woburn, Woking, Wokingham, Wolverhampton, Wombwell, Woodbridge, Woodstock, Wooler, Woolwich, Wootton Bassett, Worcester, Workington, Worksop, Worthing, Wotton-under-Edge, Wymondham,
Yarm, Yarmouth, Yate, Yateley, Yeadon, Yeovil, York, Yoxall"

irish_towns <- "Abbeydorney, Abbeyfeale, Abbeyknockmoy, Abbeylara, Abbeyleix, Abbeyshrule, Abbeyside, Achill Sound, Achonry, 
Aclare, Adamstown, Adamstown, Adare, Adrigole, Affane, Aghaboe, Aghabullogue, Aghada, Aghamore, Ahakista, Annacurra, Ahascragh, 
Aherla, Ahiohill, Allen, Allenwood, Allihies, Anglesboro, Annacotty, Annagassan, Annagry, Annamoe, Annascaul, Annestown, Annyalla, 
Ardagh, Ardagh, Ardara, Ardcroney, Ardee, Ardfert, Ardfield, Ardgroom, Ardmore, Ardpatrick, Ardrahan, Ardsallis, Arigna, Arklow, 
Arless, Artane, Arthurstown, Arvagh, Ashbourne, Ashford, Askeaton, Askill, Athboy, Athea, Athenry, Athgarvan, Athlacca, Athleague, 
Athlone, Athy, Attymass, Attymon halt, Aughagower, Aughleam, Aughrim, Aughrim, Avoca, Bailieborough, Balbriggan, Baldoyle, Balgriffin, 
Balla, Ballaghaderreen, Ballaghmore, Balally, Ballickmoyler, Ballina, Ballina, Ballinaclash, Ballinacurra, Ballinadee, Ballinagar, 
Ballinagh, Ballinaglera, Ballinagree, Ballinakill, Ballinalee, Ballinamore, Ballinascarty, Ballinasloe, Ballincollig, Ballindaggin, 
Ballinderreen, Ballindine, Ballindooley, Ballineen and Enniskean, Ballingarry, Ballingarry, Ballingeary, Ballingurteen, Ballinhassig, 
Ballinkillin, Ballinlough, Ballinode, Ballinroad, Ballinrobe, Ballinskelligs, Ballinteer, Ballintemple, Ballintra, Ballintober, 
Ballintogher, Ballysadare, Ballitore, Ballivor, Ballon, Ballybay, Ballybeggan, Ballyboden, Ballybofey, Ballybough, Ballybrack, 
Ballybrittas, Ballybrophy, Ballybunion, Ballycanew, Ballycarney, Ballycastle, Ballycolla, Ballyconnell, Ballyconneely, Ballycotton, 
Ballycroy, Ballycullane, Ballycumber, Ballynagall, Ballydehob, Ballydesmond, Ballyduff, Ballyduff, Ballyduff, Ballyedmond, Ballyfarnan,
Ballyfermot, Ballyferriter, Ballyfin, Ballyforan, Ballygarrett, Ballygarvan, Ballygawley, Ballyhack, Ballyhaise, Ballyhale, 
Ballyhaunis, Ballyhea, Ballyheigue, Ballyhide, Ballyhuppahane, Ballyjamesduff, Ballykeeran, Ballyknockan, Ballylanders, Ballylaneen, 
Lanesborough-Ballyleague, Ballylickey, Ballyliffin, Ballylongford, Ballylooby, Ballylinan, Ballymacward, Ballymagauran, Ballymahon, 
Ballymakeera, Ballymascanlan, Ballymoe, Ballymore, Ballymore, Ballymore Eustace, Ballymote, Ballymount, Ballymun, Ballymurphy, 
Ballynacally, Ballynacargy, Ballynacregga, Ballynahinch, Baile na hAbhann, Ballynanty, Ballyogan, Ballyporeen, Ballyragget, Ballyroan, 
Ballysaggart, Ballyshannon, Ballysloe, Ballyvary, Ballyvaughan, Ballyvourney, Ballywilliam, Balscadden, Baltimore, Baltinglass, 
Banagher, Bandon, Bangor Erris, Bannow, Bansha, Banteer, Bantry, Barefield, Barleycove, Barna, Barnane, Barndarrig, 
Barrowhouse village, Batterstown, Bawnboy, Bayside, Bealadangan, Bective, Bekan, Belcarra, Belclare, Belderrig, Belfield, 
Bellanagare, Bellanamullia, Bellavary, Bellewstown, Belmullet, Belturbet, Belvelly, Bennettsbridge, Bettystown, Binghamstown, 
Birdhill, Birr, Blacklion, Blackrock, Blackrock, Blackrock, Blackwater, Blanchardstown, Blarney, Blennerville, Blessington, 
Blue Ball, Boherbue, Bohola, Bonniconlon, Boolavogue, Booterstown, Borris, Borris-in-Ossory, Borrisokane, Bree, Borrisoleigh, 
Boston, Bouladuff, Boyerstown, Boyle, Bracknagh, Brandon, Bray, Breaffy, Brickens, Bridgend, Broadford, Broadford,
Broadford, Broadstone, Broadway, Brosna, Brosna, Bruckless, Bruff, Buckode, Bullaun, Bun an Churraigh, Buncrana, Bunclody, 
Bundoran, Bunmahon, Bunnanadden, Bunratty, Burnfoot, Burtonport, Butlersbridge, Buttevant, Cabinteely, Cabra, Cadamstown, 
Caherconlish, Caherdaniel, Cahersiveen, Cahir, Cahiracon, Callan, Caltra, Calverstown, Camp, Campile, Camus, Canningstown, 
Cappagh, Cappamore, Caragh, Carlingford, Carlow, Carnaross, Carndonagh, Carran, Carraroe, Carrick, Carrickbeg, Carrickmacross, 
Carrickmines, Carrick-on-Shannon, Carrick-on-Suir, Carrigadrohid, Carrigaholt, Carrigaline, Carrigallen, Carriganimmy, Carrigans, 
Carrigart, Carrigeen, Carrigtwohill, Carrowteige, Cashel, Casla, Castlebaldwin, Castlebar, Castlebellingham, Castleblakeney, 
Castleblayney, Castlebridge, Castlecomer, Castleconnell, Castlecove, Castledaly, Castledermot, Castlefin, Castlegregory, Castlehill, 
Castleiney, Castleisland, Castleknock, Castlelyons, Castlemaine, Castlemartyr, Castleplunket, Castlepollard, Castlerea, Castleshane, 
Castletown, Castletownbere, Castletown-Geoghegan, Castletown-Kinneigh, Castletownroche, Castletownshend, Castletroy, Causeway, 
Cavan, Celbridge, Chapelizod, Chapeltown, Charlestown, Charleville, Cheekpoint, Cherrywood, Churchill, Churchtown, Churchtown, 
Cill Ghallag%C3%A1in, Citywest, Claddaghduff, Clane, Clara, Clarecastle, Clareen, Claregalway, Claremorris, Clarina Village, 
Clashmore, Cleariestown, Cleggan, Clifden, Clogh, Cloghan, Cloghan, Cloghane, Clogheen, Clogherhead, Cloghroe, Clohamon, Clonaghadoo, 
Clonakilty, Clonbur, Clondalkin, Clondrohid, Clonegal, Clones, Clonfert, Clonlara, Clonliffe, Clonmacnoise, Clonmany, Clonmel, 
Clonmellon, Clonmore, Clonmore, Clonony, Clonoulty, Clonroche, Clonsilla, Clonskeagh, Clontarf, Clontibret, Cloonacool, Cloonbonniffe,
Cloondara, Cloone, Cloonfad, Cloonfush, Cloughduv, Cloughjordan, Clounanaha, Cloyne, Coachford, Cobh, Coill Dubh, Colehill, 
Collinstown, Collon, Collooney, Cong, Conna, Convoy, Coolafancy, Coolaney, Coolboy, Coolderry, Coolgreany, Coolkenno, Coolmine, 
Coolock, Coolrain, Coonagh, Cooraclare, Cootehall, Cootehill, Corduff, Corlough, Cornafulla, Cornamona, Cornelscourt, Corofin, 
Corofin, Corroy, Courtmacsherry, Courtown, Craanford, Cranford, Cratloe, Craughwell, Crecora, Cree, Cregganbaun, Creggs, Crettyard, 
Croagh, Croghan, Crolly, Crookhaven, Crookstown, Crookstown, Croom, Cross, Crossabeg, Crossbarry, Crossdoney, Crosshaven, Crossmolina, 
Crumlin, C%C3%BAil Aodha, Culdaff, Cullen, Cullenstown, Cullohill, Curracloe, Curraghboy, Currans, Currow, Cushina, Cushinstown,
Daingean, Dalkey, Daly's Cross, Deansgrange, Delphi, Delvin, Derrew, Derrinturn, Derrybeg, Derrybrien, Derrynane, Dingle, Dolla, 
Dollymount, Dolphin's Barn, Donabate, Donaghmede, Donaghmore, Donegal, Doneraile, Donnybrook, Doochary, Dooega, Doohoma, Doolin, 
Doon, Doon, Doonaha, Doonbeg, Dooniver, Douglas, Downings, Dowra, Drimnagh, Drimoleague, Dripsey, Drinagh, Drogheda, Dromahair, 
Dromahane, Donnycarney, Dromcolliher, Dromiskin, Dromod, Dromore West, Drum, Drum, Drumcliff, Drumcondra, Drumkeeran, Drumlish, 
Drummin, Drumraney, Drumshanbo, Drumsna, Duagh, Dualla, Duhallow, Duleek, Dunboyne, Duncannon, Duncormick, Dundalk, Dunderrow, 
Dundrum, Dundrum, Dunfanaghy, Dungarvan, Dungarvan, Dungloe, Dungourney, Dunkineely, D%C3%BAn Laoghaire, Dunlavin, Dunleer, 
Dunmanway, Dunmore, Dunmore East, Dunquin, Dunshaughlin, Durrow, Durrow, Durrus, Dysart, Dartry, Eadestown, Easky, East Wall, 
denderry, Edgeworthstown, Effin, Elphin, Emly, Emo, Emyvale, Enfield, Ennis, Enniscrone, Enniscorthy, Ballineen and Enniskean, 
Enniskerry, Ennistymon, Errew, Errill, Eyeries, Eyrecourt, Fahamore, Fahan, Falcarragh, Fanore, Farranfore, Feakle, Fedamore, 
Fenagh, Feenagh, Fennagh, Feothanach, Ferbane, Fenit, Fermoy, Ferns, Fethard, Fethard-on-Sea, Fiddown, Firies, Finglas, Finnea, 
Fintown, Finuge, Firhouse, Flagmount, Fossa, Foulkesmill, Fountainstown, Foxford, Foxrock, Foynes, Frenchpark, Freshford, Frosses, 
Furbo, Galbally, Galmoy, Garrafrauns, Garrienderk, Garristown, Garryspillane, Geesala, Geevagh, Glandore, Glangevlin, Glanmire, 
Glanworth, Glasheen, Glaslough, Glasnevin, Glassan, Glasthule, Glen, Glenamaddy, Glenageary, Glenamoy, Glenbrook, Glencolmcille, 
Glencullen, Glencullen, Glenealy, Glenfarne, Glengad, Glengarriff, Glenhest, Glenties, Glin, Glinsk, Glinsk, Glounthaune, 
Gneeveguilla, Goatstown, Golden, Goleen, Goresbridge, Gorey, Gormanston, Gort, Gortahork, Gorteen, Gortnahoe, Gortnavern, 
Gougane Barra, Goulane, Gowran, Graiguenamanagh, Granard, Grange, Grange, Grange, Grangecon, Greenan, Greencastle, Greenore, 
Grenagh, Greystones, Gurteen, Gurranabraher, Gweedore,
Hacketstown, Halfway, Harold's Cross, Headford, Herbertstown, Hollyford, Hollyfort, Hollymount, Hollywood, Holycross, 
Horse and Jockey, Hospital, Howth, Hugginstown, Hurlers Cross, Inagh, Inch, Inch, Enniscrone, Inistioge, Innishannon, 
Inniskeen, Inver, Inverin, Irishtown, Irishtown, Islandeady, Ivarstown, Inchicore, Jamestown, Johnstown, Johnstown, Johnstown, 
Johnstown Bridge, Julianstown, Kanturk, Keadue, Kealkill, Keel, Keenagh, Kells, Kenmare, Kerrykeel, Keshcarrigan, Kilbarrack, 
Kilbaha, Kilbeggan, Kilbeheny, Kilberry, Kilbricken, Kilbrin, Kilbrittain, Kilcar, Kilclooney, Kilcock, Kilconly, Kilcoole, 
Kilconnell, Kilcormac, Kilcorney, Kilcrohane, Kilcullane, Kilcullen, Kilcurl, Kildangan, Kildare, Kildavin, Kildimo, Kildorrery, 
Kildysart, Kilfenora, Kilfinane, Kilflynn, Kilgarvan, Kilglass, Kilkea, Kilkee, Kilkelly, Kilkenny, Kilkerrin, Kilkieran, Kill, 
Killadysert, Killala, Killaloe, Killanne, Killarga, Killavullen, Killea, Killea, Killeigh, Killenaule, Killimordaly, 
Killinaspick, Killiney, Killinierin, Killorglin, Kilrossanty, Killucan and Rathwire, Killurin, Killybegs, Kilmacanogue, 
Kilmacduagh, Kilmacow, Kilmacthomas, Kilmaine, Kilmaley, Kilmallock, Kilmead, Kilmeaden, Kilmeage, Kilmeedy, Kilmeena, 
Kilmessan, Kilmichael, Kilmihil, Kilmore, Kilmore Quay, Kilmoyley, Kilmuckridge, Kilnaboy, Kilnaleck, Kilnamartyra, Kilpedder, 
Kilquade, Kilronan, Kilrush, Kilshanchoe, Kilshanny, Kilskeer, Kiltale, Kilteel, Kilteely-Dromkeen, Kiltegan, Kilternan, 
Kiltimagh, Kiltormer, Kiltyclogher, Kilumney, Kilworth, Kincasslagh, Kingscourt, Kinlough, Kinnegad, Kinnitty, Kinsale, 
Kinvara, Knightstown, Knock, Knock, Knockbridge, Knockaderry, Knockadalteen, Knocknahur, Knockananna, Knockanore, 
Knockcroghery, Knocklyon, Knocknagoshel, Knocknagree, Knockraha, Knocktopher,
Labasheeda, Lackagh, Lacken, Laghy, Lahardane, Lahinch, Lanesborough-Ballyleague, Laragh, Laragh, Largydonnell, Lattin, 
Lawrencetown, Laytown, Leabgarrow, Leap, Lecanvey, Lecarrow, Leenaun, Leighlinbridge, Leitrim, Leixlip, Lemybrien, 
Letterfrack, Letterkenny, Lettermacaward, Lettermore, Lettermullen, Lifford, Liscannor, Liscarroll, Lisdoonvarna, Lisgoold, 
Lismire, Lismore, Lispole, Lisronagh, Lisryan, Lisselton, Lissycasey, Listowel, Littleton, Lixnaw, Lombardstown, Longford, 
Longwood, Lorrha, Loch an I%C3%BAir, Loughglinn, Loughlinstown, Loughmore, Loughrea, Loughshinny, Louisburgh, Louth, Lucan, 
Lyre, Maam Cross, Macroom, Machaire Rabhartaigh, Mahon Bridge, Mahoonagh, Malahide, Malin, Mallow, Manorhamilton, Marlfield, 
Maum, Mayfield, Maynooth, Mayo, Meelick, Meelick, Meelin, Meenagolan, Menlo, Merrion, Midfield Co. Mayo, Midleton, Milestone, 
Milford, Milford, Millstreet, Milltown, Milltown, Milltown, Milltown, Milltownpass, Milltown Malbay, Minane Bridge, Mitchelstown, 
Moate, Mohill, Monageer, Monaghan, Monamolin, Monaseed, Monasteraden, Monasterevin, Moneenroe, Moneygall, Monkstown, Monkstown, 
Montenotte, Montpelier, Mooncoin, Moone, Mothel, Mountbellew, Mountcharles, Mountcollins, Mountmellick, Mountnugent, Mountrath, 
Mountshannon, Mount Temple, Moville, Moycarkey, Moycullen, Moydow, Moygownagh, Moylough, Moynalty, Moyvane, Moyvoughly, Muff, 
Muine Bheag, Mulhuddart, Mulhussey, Mullagh, Mullagh, Mullaghmore, Mullinahone, Mullinavat, Mullingar, Mulranny, Multyfarnham, 
Murroe, Murrooghtoohy, Murrintown, Murrisk, Myrtleville, Myshall,
Naas, Nad, Narin, Narraghmore, Naul, Navan, Neale, Nenagh, Newbawn, New Birmingham, Newbliss, Newbridge, Newbridge, Newcastle, 
Newcastle, Newcastle West, Newcestown, New Inn, New Inn, Newmarket-on-Fergus, Newport, New Ross, Newtown, Newtown, Newtowncashel, 
Newtowncunningham, Newtownforbes, Newtowngore, Newtownmountkennedy, Ninemilehouse, Nobber, Nohoval, North Wall, Nurney, Nurney, 
O'Brien's Bridge, O'Callaghans Mills, Ogonnelloe, Oylegate, Old Leighlin, Oldcastle, Oldtown, Old Town, Omeath, Ongar, Oola, 
Oranmore, Oughterard, Oulart, Ovens, Owenbeg, Oxmantown, Oysterhaven, Palatine, Pallasgreen, Pallaskenry, Palmerstown, Parteen, 
Partry, Passage East, Passage West, Patrickswell, Paulstown, Pettigo, Piltown, Pollagh, Pontoon, Portarlington, Portlaoise, Portlaw, 
Portmagee, Portmarnock, Portnablagh, Portrane, Portroe, Portumna, Poulaphouca, Poulpeasty, Prosperous, Puckane, Perrystown, 
Quigley's Point, Quilty, Quin, Rahara, Raharney, Raheen, Raheen, Raheen, Raheny, Rakestreet, Ramelton, Ranelagh, Ranafast, 
Raphoe, Rathangan, Rathangan, Rathcabbin, R%C3%A1th Cairn, Rathconrath, Rathcoole, Rathcormac, Rathgar, Rathgormack, Rathkeale, 
Rathmines, Rathmolyon, Rathmore, Rathmullan, Rathnaconeen, Rathnew, Rathnure, Rathowen, Rathvilly, Ratoath, Rearcross, Recess, 
Redcross, Redhouse, Redhills, Rerrin, Renmore, Ring, Ringaskiddy, Ringsend, Riverchapel, Riverstick, Riverstown, Rochfortbridge, 
Rochestown, Rockchapel, Rockcorry, Rockmills, Rolestown, Roosky, Rosbercon, Roscommon, Roscrea, Rosegreen, Rosemount, Rosenallis, 
Roslevan, Rosmuc, Rossaveal, Rosscarbery, Rosses Point, Rossinver, Rosslare Harbour, Rosslare Strand, Rossnowlagh, Rossport, 
Roundstone, Roundwood, Royal Oak, Ruan, Rush, Rushbrooke, Rylane, Rialto, 
Saggart, S%C3%A1ile, Sallins, Sallybrook, Sallynoggin, Salthill, Saltmills, Sandpit, Sandycove, Sandyford, Sandymount, Scarriff, 
Scartaglen, Scraggane, Schull, Screeb, Shammer, Shanagolden, Shanbally, Shanballymore, Shankill, Shannonbridge, Shannon Harbour, 
Shannon, Sheeaun, Shercock, Sheriff Street, Shinrone, Shrule, Silvermines, Sixmilebridge, Skehana, Skerries, Skibbereen, Skreen, 
Skryne, Slane, Sligo, Smithborough, Sneem, Sooey, Spanish Point, Spiddal, Spink, St Johnston, St Mullin's, Stamullen, Staplestown, 
Stepaside, Stillorgan, Stonetown, Stoneybatter, Stradbally, Strade, Stradone, Straffan, Stranorlar, Stratford-on-Slaney, Streamstown, 
Strokestown, Summerhill, Suncroft, Sutton, Swanlinbar, Swinford, Swords, Tacumshane, Taghmaconnell, Taghmon, Taghshinny, Tallaght, 
Tallow, Tang, Tarbert, Tarmonbarry, Tassan, Teelin, Templeglantine, Templemore, Templeogue, Templenoe, Terenure, Termon, Termonfeckin, 
Terryglass, The Glen, The Harrow, The Rower, The Swan, Thomastown, Thurles, Ticknock, Timahoe, Timoleague, Timolin, Tinahely, 
Tinryland, Tinure, Tipperary, Togher, Toomevara, Touraneena, Toorlestraun, Toormakeady, Tower, Tramore, Trim, Tuam, Tuamgraney, 
Tournafulla, Tubber, Tubber, Tubber, Tubberclare, Tubbercurry, Tulla, Tullaghan, Tullahought, Tullamore, Tullow, Tullyallen, 
Tulrahan, Tulsk, Turloughmore, Two-Mile Borris, Tydavnet, Tynagh, Tyrrellspass, Tunnagh, Union Hall, Upperchurch, Upton, 
Urlingford, Urris, Valleymount, Ventry, Vicarstown, Villierstown, Virginia, Walkinstown, Walsh Island, Watch House Village, 
Waterfall, Watergrasshill, Waterville, Wellingtonbridge, Wellpark, Westport, Wexford, Whitechurch, Whitegate, Whitegate, Wicklow, 
Williamstown, Windgap, Windy Arbour, Woodenbridge, Woodford, Woodlawn, Whitehall, Yellow Furze, Youghal"



df_england <-
  tibble(town_raw = strsplit(english_towns, ',')) %>%
  unnest(town_raw) %>%
  mutate(town_raw = trimws(town_raw)) %>% 
  mutate(country = 'England')

df_ireland <- 
  tibble(town_raw = strsplit(irish_towns, ',')) %>%
  unnest(town_raw) %>%
  mutate(town_raw = trimws(town_raw)) %>% 
  mutate(country = 'Ireland')

df_towns <- 
  bind_rows(df_england, 
            df_ireland)


df_ngrams <-
  df_towns %>%
  #mutate(town_raw = trimws(town_raw)) %>%
  rowwise() %>%
  mutate(ngrams = sub_stringer(town_raw, bar = TRUE)) %>%
  mutate(ngrams = strsplit(ngrams, '\\|')) %>%
  unnest(ngrams) %>%
  mutate(ngrams = trimws(ngrams)) %>%
  mutate(ngram = nchar(ngrams)) %>%
  mutate(order = if_else(str_detect(town_raw, paste0('^', ngrams)), 'start', 'mid')) %>%
  mutate(order = if_else(str_detect(town_raw, paste0(ngrams, '$')), 'end', order)) %>%
  filter(town_raw != ngrams) %>%
  filter(ngram+1 != nchar(town_raw)) %>% 
  #ungroup() %>% 
  filter(!str_detect(ngrams, '\\s+'))

df_ngs <-
  df_ngrams %>%
  filter(ngram > 2 & ngram < 9) %>%
  #filter(ngram > 2) %>%
  count(country, ngrams, ngram, order) %>%
  group_by(country, ngram, order) %>%
  mutate(p = round(n / sum(n) * 100, 1)) %>%
  ungroup()

# save(df_ngs, file = '/Users/stuartharty/Documents/r/packages/englishtowns/data/df_ngs.rda')
# save(df_ngs, file = '/Users/stuartharty/Documents/r/packages/englishtowns/R/sysdata.rda')
# usethis::use_data(df_ngs, internal = TRUE)
# load("/Users/stuartharty/Documents/r/packages/englishtowns/R/sysdata.rda")


# save(df_ngs, file = '/Users/stuartharty/Documents/r/packages/englishtowns/Data/sysdata.rda')

# Walthamborouorth
# Stoon-ham

