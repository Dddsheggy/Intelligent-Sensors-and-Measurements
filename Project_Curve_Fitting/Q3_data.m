% -------------------------------------------------------------------
%  Generated by MATLAB on 9-May-2020 11:58:53
%  MATLAB version: 9.7.0.1190202 (R2019b)
% -------------------------------------------------------------------
                                  

P = cell(6, 1);
P{1,1} = [-0.34027211116506351 29.197586765583811];
P{2,1} = [0.0051076742142010445 -0.85103953258516774 40.332316552542075 ...
          ];
P{3,1} = [-7.3569164768776693E-5 0.016143048929517553 -1.3604912847759927 ...
          47.412612969889132];
P{4,1} = [1.7719904929725805E-7 -0.00010900897462822801 0.018655731448552648 ...
          -1.4345604873822468 48.170730041663404];
P{5,1} = [1.4904927140693938E-7 -3.7085118802437832E-5 0.0034592305828539541 ...
          -0.14395702365642249 2.0705394139437057 19.729267311206613];
P{6,1} = [2.1479776509727159E-8 -6.2948836815122729E-6 0.00074056089912818859 ...
          -0.04467109045460789 1.460899057554802 -25.16234606854125 202.94568099111925 ...
          ];

RT = [57.481378045430311 51.470229994813089 49.339328667861238 45.254511959109749 ...
      41.316366079567025 39.909368890828532 36.242876818604657 34.888032969673354 ...
      28.745669449097125 28.910167670379231 26.54443494425475 23.975644968072416 ...
      21.955384427552442 23.058508294367325 21.090012568315803 17.559806010926195 ...
      16.150782844057868 19.862075123878029 16.911453777980913 15.155633024106717 ...
      12.668184947035328 13.793130508559635 13.112199897577259 10.134027367675838 ...
      10.963234841929001 9.4631121165956618 10.281593450540738 9.93785652305102 ...
      10.026661754770283 9.7894831542314567 6.2099931725717408 5.2011661587760036 ...
      10.20486407003718 6.9038041608831717 7.5904083090132186 5.6920264720053009 ...
      5.4711624904858063 3.8278827364153925 5.2770049634035834 3.2121834442369877 ...
      5.6797009039426731 4.2964582334326522 1.0960128001599321 5.6346823388113831 ...
      2.3032676989056893 3.5771620825115127 7.0606844786415834 -0.86813228487426408 ...
      2.6685171577722078 4.8582387865359165 3.6686173221179095];

RT0 = 22;

i = 6;

j = 6;

k = 10;

n = 6;

repeat_num = 10;

test_MSE = ...
  [153.59692072558113 34.0067975501186 6.0471136519440378 0.68833341598227094 ...
   101.01252583678597 4011.1956703745082;
   147.63010824113763 32.713753969748105 15.008520633331699 14.228206567859592 ...
   355.29742555499104 6935.97908061199;
   151.35434728507022 33.887543435974756 7.9452696047179456 3.0955929614188755 ...
   234.07427324997269 7973.6471898994914;
   155.51898045721811 39.804524489287623 11.294148756683141 11.541025269366292 ...
   124.9591216237424 9055.5654084953239;
   150.20421967572616 35.806886135219095 8.0355169032670553 21.960059299385065 ...
   134.2477993241379 8090.8556923188562;
   152.70697018922422 40.605684260032646 11.907558482070915 13.822873349772488 ...
   187.89217747369085 12628.082940920431;
   154.78575205382202 39.542818166839837 11.680792113869433 2.8127234329265018 ...
   212.14930372010244 6780.4501708642438;
   157.66488679533953 43.191407063879907 14.274990617709497 5.0805338836840459 ...
   11.448537266632103 9644.2608083591385;
   152.02465891461776 38.013018813754883 14.106903858564824 5.332934468041473 ...
   156.44008079361805 9059.4562056909526;
   159.15961390729461 48.528774303699159 19.14640563251303 16.340819930759558 ...
   245.17371960815154 6640.9361016093007;
   153.46464582450315 38.610120818855457 11.944722025467154 9.4903102579196172 ...
   176.26949644518248 8082.0429269144242];

test_RT = [57.481378045430311 51.470229994813089 49.339328667861238 45.254511959109749 ...
           41.316366079567025 39.909368890828532 36.242876818604657 34.888032969673354 ...
           28.745669449097125 28.910167670379231 4.2964582334326522 1.0960128001599321 ...
           5.6346823388113831 2.3032676989056893 3.5771620825115127 7.0606844786415834 ...
           -0.86813228487426408 2.6685171577722078 4.8582387865359165 3.6686173221179095 ...
           ];

test_themo = [0 2 4 6 8 10 12 14 16 18 82 84 86 88 90 92 94 96 98 100];

themo = [0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 ...
         46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82 84 86 ...
         88 90 92 94 96 98 100];

themok = [273.15 275.15 277.15 279.15 281.15 283.15 285.15 287.15 289.15 ...
          291.15 293.15 295.15 297.15 299.15 301.15 303.15 305.15 307.15 ...
          309.15 311.15 313.15 315.15 317.15 319.15 321.15 323.15 325.15 ...
          327.15 329.15 331.15 333.15 335.15 337.15 339.15 341.15 343.15 ...
          345.15 347.15 349.15 351.15 353.15 355.15 357.15 359.15 361.15 ...
          363.15 365.15 367.15 369.15 371.15 373.15];

tmp1 = [26.410480781645365 24.266135186538918 22.675468257555387 21.415479658405161 ...
        20.328905906016075 19.312420368466064 18.305823051018226 17.282220170254632 ...
        16.239193516316575 15.190959603238682 14.161518607395934 13.178793094039563 ...
        12.269756531943074 11.456551596150348 10.75359825881435 10.16569166815583 ...
        9.6870898155044074 9.3015909904548835 8.98360102411823 8.7001903204745759 ...
        8.4141406758373023 8.0879818863993478 7.6890181439005119 7.1953442193837418 ...
        6.6028514350609839 5.9332234242770028 5.2429216795726461 4.6331608888408482 ...
        4.2608740596378993 4.3506674314921838 5.2077651764147959];

tmp2 = [202.94568099111925 158.11886527343304 122.9949574591877 95.82683518386483 ...
        75.105551302423962 59.538636006219434 48.029388728018979 39.657159835123672 ...
        33.658622110589604 29.410032022551135 7.2319438874765183 10.932456855472083 ...
        16.943948133659433 26.043356390731788 39.167808551690541 57.433503227010078 ...
        82.15558392976709 114.86900208092266 157.35036980279256 211.64080250041661 ...
        ];

train_MSE = ...
  [3.4212319306151509 0.41533782400561314 0.24260823446878238 0.23924094297649007 ...
   0.22541857194426557 0.15566842959693941;
   3.3967846642061783 0.71849886386237227 0.36045146063360212 0.3331899462348144 ...
   0.2980133235578814 0.1895152554278377;
   3.6779989425507273 0.73150365635812331 0.47901409572566744 0.46849663310637929 ...
   0.441487939939958 0.30825529610732777;
   3.2251516933553592 0.76256262125455154 0.60958302009011356 0.60958158201789192 ...
   0.59290972852182722 0.42548280896700191;
   3.7404936738103856 1.0511758186029327 0.89224362579718519 0.88867517963872744 ...
   0.87265282480202744 0.71821914906937745;
   3.9323655104865165 1.5132564639017161 1.3861806111032464 1.3860964746651467 ...
   1.3589158911060493 1.1271760553167154;
   3.92226197206579 1.442959258282642 1.2404707695936599 1.2237455361114951 ...
   1.1968956583208255 1.0844874314060786;
   3.9501351110958693 1.4818075998105535 1.3774783457812982 1.3719536416288483 ...
   1.3716839347891372 1.2002313704281935;
   4.5151336634704968 1.9680881153527117 1.8833902008857211 1.8741769645143789 ...
   1.8582567379593222 1.7023862438618553;
   4.0391839969613281 1.9087061357865027 1.8005045282961125 1.8003538758878401 ...
   1.775160075666762 1.6533167683132686;
   3.78207411586178 1.1993896357217719 1.027192489237539 1.0195510776782011 ...
   0.9991394686608055 0.85647388084945963];

train_RT = [26.54443494425475 23.975644968072416 21.955384427552442 23.058508294367325 ...
            21.090012568315803 17.559806010926195 16.150782844057868 19.862075123878029 ...
            16.911453777980913 15.155633024106717 12.668184947035328 13.793130508559635 ...
            13.112199897577259 10.134027367675838 10.963234841929001 9.4631121165956618 ...
            10.281593450540738 9.93785652305102 10.026661754770283 9.7894831542314567 ...
            6.2099931725717408 5.2011661587760036 10.20486407003718 6.9038041608831717 ...
            7.5904083090132186 5.6920264720053009 5.4711624904858063 3.8278827364153925 ...
            5.2770049634035834 3.2121834442369877 5.6797009039426731];

train_themo = [20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 ...
               58 60 62 64 66 68 70 72 74 76 78 80];
