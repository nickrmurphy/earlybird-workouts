--
-- File generated with SQLiteStudio v3.4.4 on Wed Jan 22 17:27:23 2025
--
-- Text encoding used: UTF-8
--


-- Table: levels
DROP TABLE IF EXISTS levels;

CREATE TABLE IF NOT EXISTS levels (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    key  TEXT    UNIQUE
                 NOT NULL
                 DEFAULT (lower(hex(randomblob(16) ) ) ),
    name TEXT    NOT NULL
);

INSERT INTO levels (
                       id,
                       key,
                       name
                   )
                   VALUES (
                       1,
                       '5ee177ea3719e4fa820ba6342f79d71c',
                       'Intermediate'
                   );

INSERT INTO levels (
                       id,
                       key,
                       name
                   )
                   VALUES (
                       2,
                       '8ecbc37b37af55c6e235d12faffe95e7',
                       'Beginner'
                   );


-- Table: muscles
DROP TABLE IF EXISTS muscles;

CREATE TABLE IF NOT EXISTS muscles (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    key  TEXT    UNIQUE
                 NOT NULL
                 DEFAULT (lower(hex(randomblob(16) ) ) ),
    name TEXT    NOT NULL
);

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        1,
                        '7f2801d599dc190756949883f9254f4d',
                        'Abdominals'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        2,
                        '114db4e696036f5b974082c532d4a2c6',
                        'Adductors'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        3,
                        '0d17749a0768889772e8303beb06b87d',
                        'Abductors'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        4,
                        '390d76ee3f7b2d6a06fd0c0338816420',
                        'Biceps'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        5,
                        'aeb640e5c94e1e8408a5daa9b946c365',
                        'Calves'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        6,
                        'a66808d2a9bf4ccdb9a9338d5948b4dd',
                        'Chest'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        7,
                        '8519e6ef981ea54af72e363c1e16e1c4',
                        'Forearms'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        8,
                        '7119e352e84c4add950d2b539250f209',
                        'Glutes'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        9,
                        'e4bf826aa19c25e305f2e152b7326370',
                        'Hamstrings'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        10,
                        '54ba088cedde9da0c81cc7f4d02ff73a',
                        'Lats'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        11,
                        '72a641975c346d56efd3d4b8f952a2b0',
                        'Lower Back'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        12,
                        '0f98a141c021ae339107f4f010d5459c',
                        'Middle Back'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        13,
                        '59e1cace7c7bc6ead94e173563a386e0',
                        'Traps'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        14,
                        '6052cc6dfe4e67497be3f493d9e02886',
                        'Quadriceps'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        15,
                        'e8482ef432dc0164a7a67a27ee3fdf79',
                        'Shoulders'
                    );

INSERT INTO muscles (
                        id,
                        key,
                        name
                    )
                    VALUES (
                        16,
                        'fb0084c3f58237f619c197f88239e31a',
                        'Triceps'
                    );

-- Table: equipment
DROP TABLE IF EXISTS equipment;

CREATE TABLE IF NOT EXISTS equipment (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    key  TEXT    UNIQUE
                 NOT NULL
                 DEFAULT (lower(hex(randomblob(16) ) ) ),
    name TEXT    NOT NULL
);

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          1,
                          '281e9b7e6180d890f0d9e130ecde76ab',
                          'Bands'
                      );

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          2,
                          '9908954725f042e47af0f17d475df212',
                          'Barbell'
                      );

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          3,
                          'd858e4c287bbb24db6a3eaf034c910a8',
                          'Kettlebells'
                      );

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          4,
                          'c1b57cb098618f42a8496380694b3d35',
                          'Dumbbell'
                      );

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          5,
                          'd99b7af9c87a6c04ff75b7d617fdd3d2',
                          'Other'
                      );

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          6,
                          '72425a5b179d9a57f28bf809aef5eee1',
                          'Cable'
                      );

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          7,
                          '7c8a3e3fa5956359a276e4d0d529e24f',
                          'Machine'
                      );

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          8,
                          '84ccd4f4162010fad58edad8a6e75342',
                          'Body Only'
                      );

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          9,
                          'c0d18380c46aef95aa33feaac8a8f426',
                          'Medicine Ball'
                      );

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          10,
                          'a047454590b436506ba68118c73b637e',
                          'None'
                      );

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          11,
                          '57cded131ae70250ec1649101d47070c',
                          'Exercise Ball'
                      );

INSERT INTO equipment (
                          id,
                          key,
                          name
                      )
                      VALUES (
                          12,
                          '1a25f2508ea627f0f0231772bdd26bb6',
                          'E-Z Curl Bar'
                      );


-- Table: exercises
DROP TABLE IF EXISTS exercises;

CREATE TABLE IF NOT EXISTS exercises (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    key          TEXT    UNIQUE
                         NOT NULL
                         DEFAULT (lower(hex(randomblob(16) ) ) ),
    name         TEXT    NOT NULL,
    description  TEXT,
    type         TEXT    NOT NULL,
    equipment_id INTEGER REFERENCES equipment (id) ON DELETE SET NULL,
    muscle_id    INTEGER REFERENCES muscles (id) ON DELETE SET NULL,
    level_id     INTEGER REFERENCES levels (id) ON DELETE SET NULL
);

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          1,
                          '476c8999c0b93400ca0616f640def47d',
                          'Banded crunch isometric hold',
                          'The banded crunch isometric hold is an exercise targeting the abdominal muscles, particularly the rectus abdominis or "six-pack" muscles. The band adds resistance and continuous tension to this popular exercise.',
                          'Strength',
                          1,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          2,
                          '17bf7b531db0b59edd1c0ab63ffd339c',
                          'Banded crunch',
                          'The banded crunch is an exercise targeting the abdominal muscles, particularly the rectus abdominis or "six-pack" muscles. The band adds resistance and continuous tension to this popular exercise.',
                          'Strength',
                          1,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          3,
                          '34f7874978b3946dc8212c16daf6f24e',
                          'Crunch',
                          'The crunch is a popular core exercise targeting the rectus abdominis, or "six-pack" muscles, as well as the obliques. It has been the centerpiece of many ab-focused workouts, due to both its simplicity and the intense burn and mind-muscle connection it produces. It can be performed for time or reps as part of the ab-focused portion of any workout.',
                          'Strength',
                          1,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          4,
                          '48eeaa9900c4a19afe24e1759b9536de',
                          'Decline band press sit-up',
                          'The decline band press sit-up is a weighted core exercise that works the rectus abdominis or "six pack" muscles, as well as the deep core muscles. It also taxes the muscles of the shoulders and upper back. Sit-up variations with added resistance are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of the core-focused portion of a workout.',
                          'Strength',
                          1,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          5,
                          '4d0a80041fec0d0820df3f2c1dd2b728',
                          'Band low-to-high twist',
                          'The band low-to-high twist is a core exercise targeting the upper abdominals and the obliques. Take care to perform it with control, as rapid, uncontrolled twisting can injure the spine. It is usually performed for moderate to high reps, at least 8-15 per side, as part of the core-focused portion of a workout.',
                          'Strength',
                          1,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          7,
                          '027232113b0afa99a1333057518e221d',
                          'Barbell Ab Rollout',
                          'The barbell roll-out is an abdominal exercise that utilizes a barbell in the place of an ab roller. It is best performed with a barbell that has rotating collars, and is considered more difficult than other ab roller variations. Many lifters may not be able to perform a single rep at first, but once they can perform these for reps, they''ll be rewarded with a seriously strong core.',
                          'Strength',
                          2,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          8,
                          '2f92ecf3612b202b4e6a6003752796e3',
                          'Bench barbell roll-out',
                          'The bench barbell roll-out is a challenging exercise targeting the abdominals. It is similar to using an ab roller, but using a barbell allows for a wider grip. Placing the knees on a bench rather than the floor makes the move more difficult by increasing the challenge to the upper body.',
                          'Strength',
                          2,
                          1,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          9,
                          '1be8c24bf2a263c36e60af416eeded3a',
                          'Seated bar twist',
                          'The seated bar twist is a core exercise meant to strengthen the obliques. It is often performed for high reps with relatively light weight, such as an empty barbell, a lightweight fixed-weight bar, or even a PVC pipe. It can be performed during a workout, at the end of a workout, or outside of the gym to build core strength and resiliency.',
                          'Strength',
                          2,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          10,
                          '17d4997a6c5d33475bf4ca3575f3d850',
                          'Single-arm landmine pull and press',
                          'The single-arm landmine pull and press is an explosive rotational movement using a barbell anchored in a landmine device. It combines a pull off the floor with rotation and finishes with a press. It is usually performed for low reps per set with an emphasis on speed and form, not moving heavy weight.',
                          'Strength',
                          2,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          11,
                          'cc18e7422e52ab06e7753b339dc61a0f',
                          'Decline plate sit-up',
                          'The decline plate sit-up is a weighted core exercise that works the rectus abdominis or "six pack" muscles, as well as the deep core muscles. Weighted sit-up variations are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of the core-focused portion of a workout.',
                          'Strength',
                          2,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          12,
                          'a7bf1254728a394fc3d40f178cb96da0',
                          'Kettlebell Windmill',
                          'The single-kettlebell windmill is a dynamic kettlebell exercise emphasizing core strength and shoulder and hip mobility and stability. It is often used as a functional warm-up or for multi-directional strength work. It doesn''t work as well in a metcon or conditioning setting, and shouldn''t be performed under intense fatigue.',
                          'Strength',
                          3,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          13,
                          '74b94b4a1c73a3cfb6b0efdbb71e9da4',
                          'Kettlebell 3-point leg extension',
                          'The kettlebell 3-point leg extension is a dynamic core exercise performed around and over a kettlebell or other short, stationary object. It is similar in some ways to a V-up or reverse crunch, but targets both the obliques and the rectus abdominis or "six-pack" muscles. It can be performed for reps or for time, usually in dedicated ab training or as part of a kettlebell and bodyweight circuit workout.',
                          'Strength',
                          3,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          14,
                          '689c9ef4b4d619339eb03e3f2a8e7b4b',
                          'Burpee over kettlebell',
                          'The burpee over kettlebell is a more advanced version of a popular conditioning exercise. If you''re performing a circuit that already has both burpees and kettlebell movements, it''s a simple way to provide a novel stimulus to the muscles of the lower body and create a more athletic style of training.',
                          'Strength',
                          3,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          15,
                          '2ebfeb189bafbd06d91d140b925adae3',
                          'Kettlebell toe-touch',
                          'The kettlebell toe-touch is a more difficult version of a highly popular abdominal movement usually done for high reps. The simple addition of a weight makes the toe-touch far more difficult, providing a different stimulus to the core during training.',
                          'Strength',
                          3,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          16,
                          '4c46ba3b4f7bb1e7d1ca0e6d702afc43',
                          'Kettlebell swing',
                          'The kettlebell swing is a popular lower-body exercise emphasizing the hamstrings, glutes, and back muscles. It is often used to train explosive power, for aerobic or cardiovascular conditioning, in circuit training, or as an accessory movement for the deadlift.',
                          'Strength',
                          3,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          17,
                          'c2cb9b1d2a947aa55c1232f3df1da1ea',
                          'Two-way swing',
                          'The two-way kettlebell swing is an exercise that alternates a chest-height kettlebell swing (sometimes called a "Russian" or "hardstyle" swing) with an overhead kettlebell swing (sometimes called an "American" swing). Both swing variations work many of the same muscles, such as the hamstrings, glutes, and core, but because the weight must travel farther in the overhead swing, it''s slightly more metabolically demanding and works the upper back and shoulders more. This combo can be performed for time or reps and works especially well in circuit-style or full-body training. If you can''t perform the overhead swing without lower back or shoulder pain, just perform the chest-height swing.',
                          'Strength',
                          3,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          18,
                          '880cd42e0eac955d825356080456364a',
                          'Kettlebell crab reach',
                          'The kettlebell crab reach is a kettlebell pressing exercise in which the lifter presses a kettlebell overhead while in a modified single-arm bridge position. The simple addition of a weight makes the reach far more difficult, challenging the muscles of the back, shoulders, glutes, and core.',
                          'Strength',
                          3,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          19,
                          '3c569f7a967c3d6561cc4b3027a848d9',
                          'Dumbbell V-Sit Cross Jab',
                          'The dumbbell V-sit cross jab is a hybrid movement that trains the abdominal and shoulder muscles simultaneously. It can address multiple muscle groups in a time-efficient muscle-building or circuit-style workout, while also providing a cardiovascular challenge.',
                          'Strength',
                          4,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          20,
                          '563ec246d9284659776726d2c1f6b2ff',
                          'Dumbbell spell caster',
                          'The dumbbell spell caster is an exercise that primarily targets the abdominal muscles such as the obliques. However, it also works shoulders, back, hips, and legs, and demands all of those muscles work together in a coordinated motion. It is usually performed with relatively light weights for moderate to high reps, at least 8-12 reps per side. Make sure to only use a weight you can control.',
                          'Strength',
                          4,
                          1,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          21,
                          '76292b70f38a75d54377e210716c08dd',
                          'Dumbbell side bend',
                          'The dumbbell side bend is a popular exercise for targeting the oblique muscles of the abdomen. It is usually performed for relatively high reps, at least 8-12 reps per set or more. It can be performed one side at a time or alternating sides.',
                          'Strength',
                          4,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          22,
                          '07d94a83158d0c296d855b315ee1efee',
                          'Dumbbell crunch',
                          'The dumbbell crunch is a more difficult version of a highly popular abdominal movement. The simple addition of a weight makes the crunch far more difficult, providing a different stimulus to the core during training.',
                          'Strength',
                          4,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          23,
                          '7b9c50852a92b77b06ddbe1788f4cace',
                          'Dumbbell T-hold',
                          'The dumbbell T-hold is a static exercise that primarily targets the obliques, although it also works the shoulders and upper back. It involves holding a dumbbell in the air while in a side plank position. It is usually performed for timed holds, although it can be performed dynamically for reps as a plank with dumbbell rotation.',
                          'Strength',
                          4,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          24,
                          'b10dbcb97ee0994a7b0f7381fb794b03',
                          'Dumbbell hollow-body floor press',
                          'The dumbbell hollow-body floor press combines upper-body strength and core work in one move.',
                          'Strength',
                          4,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          25,
                          '6d24f49db7147b149d468099df7676cc',
                          'Dumbbell crusher',
                          'The dumbbell crusher is a dumbbell complex that combines a squat with a dumbbell curl, followed by a triceps press. It targets the legs, glutes, biceps, shoulders, and triceps in a single sequence, making it a great way to burn serious calories and hit a lot of muscles in a short period of time. The upper-body movements will determine the amount of weight you can effectively use.',
                          'Strength',
                          4,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          26,
                          '3a7678656ddff8677fcf6a0479123f4a',
                          'Single-arm dumbbell crunch',
                          'The single-arm dumbbell crunch is a more difficult version of a highly popular abdominal movement. Adding a weight to one side makes the crunch far more difficult to your rectus abdominis or "six-pack" muscles, as well as the obliques and deep core muscles.',
                          'Strength',
                          4,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          27,
                          'aefc218d456f9bd702a9352a977563be',
                          'Dumbbell straight-legged hip raise',
                          'The dumbbell straight-legged hip raise works the hips and glutes. It requires and teaches body control and coordination.',
                          'Strength',
                          4,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          28,
                          '712c560b9c26ce4b3bd81e5a235b42bd',
                          'Seated leg tuck with dumbbell',
                          'The seated leg tuck with dumbbell is an ab exercise requiring only a bench and a dumbbell. It''s commonly performed for high reps as a burnout at the end of a core workout.',
                          'Strength',
                          4,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          30,
                          '1b3ecdd147a811e20f56cbb4bfa01d37',
                          'Landmine twist',
                          'The landmine twist is a rotational abdominal movement performed using an angled barbell anchored at floor level in a landmine device. It can also be performed by sticking a barbell in the corner of a room, preferably in a towel to protect the walls. It targets the deep muscles of the core, including both the obliques and the transversus abdominis. It can be done fast or slow, for time or reps, either in traditional muscle-focused rep ranges such as 8-12 reps per side or for higher rep ranges.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          31,
                          'a66134a5a028edf25c967ecebc4c729c',
                          'Suspended ab fall-out',
                          'The suspended ab fall-out is a dynamic abdominal exercise utilizing a suspension strap system or gymnastic rings. It is similar in form to an ab roller, but can more easily be scaled to be more or less difficult. It targets the muscles of the rectus abdominis or "six-pack" muscles, as well as the deep core muscles. It can be trained for low reps for strength or higher reps for muscle definition.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          32,
                          '8cb15c4c239e14b27c6380d86c6584d5',
                          'Decline reverse crunch',
                          'The decline reverse crunch is a popular bodyweight exercise targeting the abdominal muscles, particularly the lower abs. It is usually performed for high reps, such as 10-15 reps per set or more, as part of the ab-focused portion of a workout.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          33,
                          'c86178e9d3b780d86dae2a263f08b02a',
                          'Weighted Crunches',
                          'The weighted suitcase crunch is a weighted version of a popular abdominal training exercise. The simple addition of a weight makes the suitcase crunch far more difficult, helping build the "six pack" muscles and providing a different stimulus to the core during training.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          34,
                          '77bf2a4b0ec6718087b8148cf31484c0',
                          'Otis-Up',
                          'The Otis-up is a weighted exercise focusing on the abdominal muscles, as well as the shoulders to a lesser degree. It primarily targets the rectus abdominus or “six-pack” muscles, but also involves the obliques and deep core muscles. It is normally performed on a decline bench holding a weight plate, but can also be performed with a dumbbell, kettlebell, or other weight.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          35,
                          'a0c20924b6e52f536d0686e0692bf32c',
                          'Captain''s chair knee raise',
                          'The captain''s chair knee raise is a bodyweight exercise that targets the abs. It is performed on an apparatus that allows the forearms to rest on pads and the upright torso to hang freely. Knee raises are often performed for moderate to high reps, such as 8-12 reps or more, as part of ab-focused training.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          36,
                          '4616598be3390c892db61b6c0d216ba7',
                          'Decline bar press sit-up',
                          'The decline bar press sit-up is a weighted core exercise targeting the abdominal muscles, particularly the lower abs. It also challenges the shoulders and upper back to move the weight. Weighted sit-up variations are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of the core-focused portion of a workout.',
                          'Strength',
                          2,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          37,
                          '236b2a226dd96c8c123738b0ab99491d',
                          'Pallof press',
                          'The Pallof press is an isometric exercise that trains core stability. It involves resisting rotation from a cable or band, developing what is sometimes called "anti-rotation" core strength. It is most often seen in programs for athletes who compete in sports that test strength, power, and functional movements. It can be trained in timed holds or for reps by pressing the cable or band away from the body.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          38,
                          'e83c8e1f27a2000bdcdc9bbd23317e5d',
                          'Weighted Sit-Ups - With Bands',
                          'The weighted sit-up is a more difficult version of a highly popular abdominal movement. The simple addition of a weight makes the sit-up far more difficult, providing a different stimulus to the core during training and helping build strong abs.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          39,
                          'adfc43420c840771f56b01a7b727d52f',
                          'Suitcase crunch',
                          'The suitcase crunch is a bodyweight movement that targets the muscles of the abs, the rectus abdominis or "six-pack" muscles in particular. It is similar to a V-up, but the lower back stays flat against the ground. It can be performed for time or reps in the ab-focused portion of any workout.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          40,
                          '5cc532748f0a787da4b6b3649adda4c3',
                          'Barbell press sit-up',
                          'The barbell press sit-up is a weighted exercise focusing on the abdominal muscles, as well as the shoulders to a lesser degree. It primarily targets the rectus abdominis or "six-pack" muscles, but also involves the obliques and deep core muscles. It can be performed on the floor with the feet anchored or unanchored, or on a decline or other bench. It is similar to the Otis-up, which is performed with a weight plate.',
                          'Strength',
                          2,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          41,
                          '728fcf664cddb11056fc55fc09363434',
                          'Single-arm bent-over rear delt fly',
                          'The single-arm bent-over rear delt fly is a popular upper-body exercise that targets the muscles on the back of the shoulder joint, specifically the rear head of the deltoid. Since pressing movements build the front and (to a lesser degree) side deltoid heads, this move is often done to promote balanced shoulder development. It is usually performed for high reps, such as 10-15 reps per set or more, as part of a shoulder or upper-body workout.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          42,
                          '040aaf3f0e0026dc6a2e714ff70ea08f',
                          'Captain''s chair leg raise',
                          'The captain''s chair leg raise is a bodyweight exercise that targets the abs. It is performed on an apparatus that allows the forearms to rest on pads and the upright torso to hang freely. Leg raise variations are often performed for moderate to high reps, such as 8-12 reps or more, as part of ab-focused training.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          43,
                          'e2eb126537ad6c16abb81fb1217296f0',
                          'Bench crunch',
                          'The bench crunch is a popular ab exercise performed lying on a bench. It is largely similar to the same exercise performed on the floor, but being able to press the lower back into the bench pad can help reinforce proper form and increase the burn in the abs. Like most crunch variations, it is usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          44,
                          'ec4f14967f04d74fca6f74e77db4ff92',
                          'Reverse ab roll-out',
                          'The reverse ab roll-out is an exercise targeting the abdominals. It''s a twist on the ab wheel roll-out, and is similar to a body saw exercise, only performed on a foam roller. Instead of your arms moving and your lower body remaining stationary, your lower body moves and your arms remain stationary. Beginners may need to use a limited range of motion.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          45,
                          'ba4b4f804ddc513bc0edca59201c9be0',
                          'Suspended crunch-',
                          'The suspended crunch is an abdominal exercise performed with the feet in the stirrups of a suspension strap system. It targets the muscles of the core, most prominently the rectus abdominis or "six-pack" muscles, but also taxes the shoulders and deep core muscles.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          46,
                          'b6f2de7091514c8eebf123c61a7aeba3',
                          'Suspended oblique crunch',
                          'The suspended oblique crunch is an abdominal exercise performed with the feet in the stirrups of a suspension strap system. It targets the muscles of the core, most prominently the obliques, but also the rectus abdominis or "six-pack" muscles, the shoulders, and deep core muscles.',
                          'Strength',
                          5,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          48,
                          '3b32363c088fff471ccf99d447fa5fbd',
                          'Standing cable low-to-high twist',
                          'The standing cable low-to-high twist is a core exercise targeting the upper abdominals and the obliques. Take care to perform it with control, as opposed to violent twisting which can injure the back. It is usually performed for moderate to high reps, at least 8-15 per side, as part of the core-focused portion of a workout.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          49,
                          '1c0e588c3d474a4f8f48493e51f600ab',
                          'Single-arm high-cable side bend',
                          'The single-arm high-cable side bend is an exercise targeting the obliques using a cable stack machine.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          50,
                          '3fc4aa4027a7c407007213f1824c01c4',
                          'Kneeling cable oblique crunch',
                          'The kneeling cable oblique crunch is a popular core isolation exercise using a rope attachment and cable stack while kneeling on the floor. It primarily targets the obliques and rectus abdominis or "six-pack" muscles, but also strengthens the deep core muscles. It is most commonly performed for moderate to high reps, such as 8-12 reps per set or higher.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          51,
                          '2ae4018cc5ea66d93b1680399106f51e',
                          'Kneeling cable crunch',
                          'The kneeling cable crunch is a popular core isolation exercise using a rope attachment and cable stack while kneeling on the floor. It primarily targets the rectus abdominis or "six-pack" muscles, but also strengthens the deep core muscles. It is most commonly performed early in an ab workout, usually in moderate to high reps, such as 8-12 reps per set or higher.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          52,
                          'd599afbbf6e2e07cba10d13c66c94c9b',
                          'Rope Crunch',
                          'The kneeling cable crunch is a popular core isolation exercise using a rope attachment and cable stack while kneeling on the floor. It primarily targets the rectus abdominus or "six-pack" muscles, but also strengthens the deep core muscles. It is most commonly performed early in an ab workout, usually in moderate to high reps like 8-12 reps per set or higher.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          53,
                          '9c5c3e3958443ab77dd22e50ad9d95cf',
                          'Standing cable crunch',
                          'The standing cable crunch is a popular core isolation exercise using a rope attachment. It primarily targets the rectus abdominis or "six-pack" muscles, but also strengthens the deep core muscles. It is most commonly performed early in an ab workout, usually in moderate to high reps, such as 8-12 reps per set or higher.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          54,
                          '090973e1b5082e4e041e9263c5602d8e',
                          'Standing Cable Wood Chop',
                          'The standing cable high-to-low twist is a core exercise targeting the lower abdominals and the obliques.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          55,
                          '051e2136442de3b72e36827628c5dcb6',
                          'Cable reverse crunch',
                          'The cable reverse crunch is performed on the ground facing away from a high pulley, which helps target the lower abdominals specifically.',
                          'Strength',
                          6,
                          1,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          56,
                          'c42a3a878fa120917a7614161431d19e',
                          'Pallof press with rotation',
                          'The Pallof press with rotation is a dynamic variation of the Pallof press that incorporates weighted rotation away from the torso using resistance from a cable pulley. It is intended to build abdominal strength and teach proper bracing. It can be performed for time or for reps in the core-focused portion of any workout.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          57,
                          '59d617dfe0317b5072489170c3e418bf',
                          'Standing cable high-to-low twist',
                          'The standing cable high-to-low twist is a core exercise targeting the lower abdominals and the obliques. Take care to perform it with control, as opposed to violent twisting which can injure the back. It is usually performed for moderate to high reps, at least 8-15 per side, as part of the core-focused portion of a workout.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          58,
                          '833fb20774e4ddbf80eaaf1a2b2dbb27',
                          'Standing cable twist',
                          'The standing cable twist is a core exercise that targets the abdominals, particularly the obliques. Take care to perform it with control, as opposed to violent twisting which can injure the back. It is usually performed for moderate to high reps, at least 8-15 per side, as part of the core-focused portion of a workout.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          59,
                          '807dcc46786707560a74a628c22c991c',
                          'Cable lying twist on ball',
                          'The cable lying twist on ball is an exercise targeting the core and obliques with the added challenge of stability to keep from losing position on the unstable surface.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          60,
                          'eeed3a494d0514e366eb58c4e710bd7e',
                          'Single-Arm Cable Outward-Facing Biceps Curl',
                          'The single-arm cable outward-facing biceps curl is a cable exercise that targets the biceps. It is performed standing in front of a cable machine facing away from the cable stack to increase the range of motion by fully extending the elbows. This movement is usually performed for moderate to high reps for a burn and pump as part of an arm-focused workout.',
                          'Strength',
                          6,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          61,
                          'f1227e0ae0634e4919b0041009613139',
                          'Smith machine straight-legged hip raise',
                          'The Smith machine straight-legged hip raise is an exercise targeting the abdominal muscles. Because of the potential awkwardness of getting into position, it is usually performed for moderate to high reps, such as 8-12 reps per set or more. If your Smith machine has safety bars, set them at a height that allows you a full range of motion while giving adequate protection from the weight potentially falling.',
                          'Strength',
                          7,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          62,
                          '750128d3d86b050480d9e7fb9911b99a',
                          'Machine crunch',
                          'The machine crunch is a machine-based exercise targeting the abdominal muscles. It involves sitting upright in the machine and curling the torso down against a pre-set level of resistance. On some machines, the knees also curl up toward the torso. Crunch machines usually use extra resistance in the form of selectorized weight stacks or plate loading, and are often performed for moderate to high reps, such as 8-12 reps per set or more, as part of the ab-focused portion of a workout.',
                          'Strength',
                          7,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          63,
                          '6f9ac31d2fd6c4557c680c520656c2d1',
                          'Smith machine V-up',
                          'The smith machine V-up is a weighted abdominal exercise that involves pressing a weighted bar upward while performing a V-up. Performing it in a Smith machine eliminates the balance challenge of a free weight. It is usually performed for moderate to high reps in the ab-focused portion of a workout.',
                          'Strength',
                          7,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          64,
                          '90effb87d182f16f8c86c76da2ad3ce0',
                          'Elbow plank',
                          'The elbow plank is a popular isometric abdominal exercise. It is common in all types of exercise programs, as well as in group fitness and yoga classes. It targets the muscles of the core, the deep core or transversus abdominis in particular. It is also often prescribed for time to help back pain or to teach proper bracing.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          65,
                          'bc3e9a43bfc18d96888af0af89fce294',
                          'Bottoms Up',
                          'The lying leg lift is a popular bodyweight exercise targeting the muscles of the abs, the rectus abdominis or “six-pack” muscles in particular. It can be performed for time or reps in the core-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          66,
                          '621dc7f6aff8f77e1b93c1263cb3cd44',
                          'Spider crawl',
                          'The spider crawl is a bodyweight exercise that involves crawling on the floor with the knees outside of the elbows. It is different from a leopard crawl in that the hips are higher, and it''s different from a bear crawl because the knees are wider. It can be done as a full-body warm-up, in short bursts for power or circuit training, or for longer durations as cardiovascular conditioning.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          67,
                          'fd45142d1cd6b50554dcd6f6a46a4205',
                          'Cross-Body Crunch',
                          'The elbow-to-knee crunch is a bodyweight exercise targeting the ab muscles, the obliques and rectus abdominis or "six-pack" muscles in particular. It can be performed for time or reps as part of the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          69,
                          '4d12b6bae8b3b6901c23b9cdebef5f1a',
                          'Decline Crunch',
                          'The decline crunch is an effective core exercise targeting the rectus abdominis.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          70,
                          '502c516385d3704b0348a1601b927e59',
                          'Hanging toes-to-bar',
                          'The hanging toes-to-bar is an advanced abdominal exercise in which the lifter touches their feet to a pull-up bar. There are many ways to perform this movement (strict or swinging, arms completely straight or slightly bent, legs straight or bent) each providing unique benefits and challenges. Initially, it may be a difficult move to do for a single rep, but once you build the requisite core, lat, and shoulder strength, it can be performed for higher reps.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          71,
                          '1e40501be859b4a68b1588e9fc8f7285',
                          'Hanging Oblique Knee Raise',
                          'The hanging oblique crunch an abdominal exercise that targets both the rectus abdominus or “six-pack” muscles, and the oblique muscles. It can be performed hanging from a bar, or if grip strength is a limitation, by placing the elbows in ab straps. If hanging from a straight bar is uncomfortable to the wrists or shoulder, you can also perform them hanging with a neutral grip (palms facing one another)',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          72,
                          '7ed6f9221ecaa8423f8cbaafe93a083c',
                          'Hanging leg raise',
                          'The hanging leg raise is an exercise targeting the abs, but which also works the lats and hip flexors. Instead of resting your forearms on the pads of a captain''s chair, you perform these hanging from a bar. Experienced lifters make these look easy, but beginners may need time to build up to sets of 8-12 reps.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          73,
                          '4087a2bb61b8fa2c0608a36ecbfbe739',
                          'Reverse crunch',
                          'The reverse crunch is a popular exercise targeting the abdominals, particularly the lower half. It’s easy to perform on either the floor or a flat bench. Many lifters think of this as a companion to the crunch, which targets the upper abdominals more than the lower.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          75,
                          '8cc3cec62b9e2c0f9b57519535100437',
                          'Dead bug reach',
                          'The dead bug reach is an exercise for strengthening the core in which you alternate lowering your opposing arm and leg simultaneously, controlling the movement with the abdominal muscles. It can be part of a dynamic warm-up to activate the core for other athletics or lifting, or be performed in a circuit or on its own in the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          76,
                          'a93e9f8e199744dab659fc32f83a144a',
                          'V-up',
                          'The V-up is a bodyweight movement that targets the muscles of the abs, the rectus abdominis or "six-pack" muscles in particular. It is similar to a suitcase crunch, but the lower back lifts off the ground at the top of each rep. It can be performed for time or reps in the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          77,
                          '4f3713944829f0b41e57ce6d2f6aed74',
                          'Russian twist',
                          'The Russian twist is an exercise targeting the abdominals and the obliques. Beginning from a position that resembles stopping midway through a sit-up, it involves twisting side to side. It can be performed with body weight alone or while holding a weight plate or other object. It is performed by alternating sides with each rep and can be done for time or for a specific number of reps as part of the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          79,
                          'fd2bcf91f3c3b5b5330c2363a4dcca67',
                          'Knees tucked crunch',
                          'The knees tucked crunch is a core exercise that involves performing a crunch while keeping the knees bent in a 90-degree position. It primarily targets the rectus abdominis or "six-pack" muscles. It can be performed for time or reps as part of any abs-focused circuit or workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          80,
                          '3b79104a6e0772dbbf4fcd697af79035',
                          'Feet-elevated oblique crunch',
                          'The feet-elevated oblique crunch is a variation on the crunch exercise that targets the obliques as well as the rectus abdominis or "six-pack" muscles. Resting the feet on a bench takes some of the hip flexor activation out of the movement, focusing the stress more on the abs.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          81,
                          'f78ad11ad1171435b343c5c057c4cdca',
                          'Bent-knee reverse crunch',
                          'The bent-knee reverse crunch is a popular bodyweight core exercise. It targets the lower portion of the rectus abdominis or "six-pack" muscles. It can be performed for time or reps as part of any ab-focused workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          82,
                          'caa7c7366c206b01c2f18327e2d9ae12',
                          'Alternating heel-touch',
                          'The alternating heel-touch is a popular bodyweight exercise that targets the obliques, as well as the rectus abdominis, or "six-pack" muscles. It can be performed for time or reps as part of any abs-focused circuit or workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          83,
                          '11b8118568ac7ec3df6b583df0c5e573',
                          'Lying bench reverse crunch',
                          'The lying bench reverse crunch is a popular ab exercise performed by bringing the knees toward the chest while lying on a bench. It is largely similar to the same exercise performed on the floor, but being able to press the lower back into the bench pad can help reinforce proper form and increase the burn in the abs. Like most crunch variations, it is usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          84,
                          '4373bef94ef030af437a780352343e8a',
                          'Sit-up',
                          'The sit-up is a popular bodyweight exercise focused on the abdominal muscles. It has also been used as part of military, tactical, and scholastic fitness tests for many years. It can be performed for time or reps, with the feet anchored or free, on flat ground or a bench.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          85,
                          'c2b9cc74eca8950660d3064120f44121',
                          'Side Bridge',
                          'The side plank is a popular isometric abdominal exercise focusing on the oblique muscles, as well as the transversus abdominis or deep core muscles. It is sometimes paired with the curl up and bird dog as the “McGill big three” for core strength and stability. It is performed for time and can work in a warm-up or in the core-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          86,
                          '442be6ee00ed628fd20c88b6cb3531f1',
                          'Lying oblique crunch',
                          'The lying oblique crunch is a bodyweight exercise targeting the oblique muscles. It can be performed for a specific number of reps or to fatigue or failure as part of the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          88,
                          'b32ca9adee89f0ed565a0f6fae848be6',
                          'Hanging knee raise with manual resistance',
                          'The hanging knee raise with manual resistance is a more advanced version of the hanging knee raise that utilizes a partner. The partner applies enough resistance to make the movement more difficult, while still allowing the lifter to perform multiple reps.',
                          'Strength',
                          8,
                          1,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          89,
                          '7a0af480521724110336f9dc6864e414',
                          'Hanging leg raise with throw down',
                          'The hanging leg raise with throw down is a more advanced version of the hanging knee raise that utilizes a partner to make the movement more difficult. The partner pushes down at the top of each rep, forcing the lifter to "fight back" with their abs.',
                          'Strength',
                          8,
                          1,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          90,
                          '4e544c6b2a2195de578ab5864cd4f8a4',
                          'Exercise ball knee roll-in',
                          'The exercise ball knee roll-in is an abdominal exercise that involves supporting yourself with your hands in a plank or push-up position and drawing the knees in toward the chest. This is a fairly advanced abdominal move requiring a fair amount of core strength.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          91,
                          '38f9776300293c2146bb17959757cee1',
                          'Crab toe-touch',
                          'The crab toe-touch is a full-body exercise targeting the glutes, hamstrings, quads, and core. It is a challenging move that trains balance, core strength, and many muscle groups, making it work well in a time-efficient bodyweight circuit workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          92,
                          '169f2408fd3af4fc5653e5491f43940a',
                          'Side kick-through',
                          'The side kick-through is a full-body movement that involves isometric holds and moving the body through different ranges of motion, beginning in a bear crawl position. The difference between a side kick-through and a sit-through is that your butt stays off the ground throughout the entire rep. It is commonly performed in bodyweight circuits and animal-style flows, but can also work for reps on its own or as part of a dynamic warm-up or mobility sequence.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          93,
                          '2fb4e7efe8073f552d37c2cf518d2a8a',
                          'Jump Lunge',
                          'The alternating lunge jump is an explosive bodyweight exercise that targets the lower-body muscles, including the quads, glutes, and hamstrings. It can be performed for time or reps in power training, and is also effective in any fat-loss or athleticism-focused workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          94,
                          'da5865276763509551562ec6c80b89c4',
                          'Side plank hip dip',
                          'The side plank hip dip is a dynamic version of the side plank exercise focusing on the oblique muscles, as well as the transversus abdominis or deep core muscles. It can be performed for time or reps and can work in a warm-up or in the core-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          95,
                          '1b4128fd4b9653d5a5febb9f7f1d79b2',
                          'Elbow plank jack',
                          'The elbow plank jack is an isometric abdominal exercise with a dynamic lower-body component. It targets the muscles of the core, the deep core or transversus abdominis in particular. It can be performed for time or reps in the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          96,
                          '7947c62e40221d57d47f5c08c6ff6e0b',
                          'Exercise ball V-up',
                          'The exercise ball V-up is a popular movement to target the abdominal muscles, particularly the rectus abdominis or "six-pack" muscles. It involves passing an exercise ball or yoga ball back and forth between the hands and feet while performing V-ups. It can be performed for reps or time as part of any ab-focused workout or bodyweight circuit.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          97,
                          '2c1cc6bfb38e24e2cb309fe7f7a17ed7',
                          'Standing torso twist stretch',
                          'The standing torso twist stretch is a stretching exercise targeting the lats and core, particularly the obliques. It’s great before a workout or any sporting event that involves a lot of twisting of the upper body.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          98,
                          'a1ba8f7f602e300477de1bfc531b127f',
                          'Bear crawl',
                          'The bear crawl is a popular bodyweight crawling exercise. While it looks simple, the bear crawl is an intense full-body movement that targets the cardiovascular system as well as a wide range of muscle groups, the shoulders, core, and legs in particular. It can be done as a full-body warm-up, in short bursts for power or circuit training, or for longer durations as cardiovascular conditioning.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          99,
                          'b4374d051f5072762198522e633d2566',
                          'Side lunge cross-body heel-touch',
                          'The side lunge cross-body heel-touch is a lower-body exercise targeting the quads, glutes, and hamstrings. The heel-touch adds a slight rotational challenge.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          101,
                          'd9af7fb71a690686fd561b6f04fe65d6',
                          'Lying cross-over lower back stretch',
                          'The lying cross-over lower back stretch is a simple bodyweight stretch targeting the lower back, hips, and torso. It involves rotating the legs while lying flat on the back. It is commonly included in dynamic warm-ups, but can also be performed as full-body mobility work anytime.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          102,
                          '5888415042258d44e19cdf9267a9a1b7',
                          'Shoulder tap',
                          'The shoulder tap is an exercise targeting the abdominals and core. The basic stance matches the top of a push-up position. From there, one hand is raised to tap its opposing shoulder. A tap with each hand to each opposing shoulder equals one rep.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          103,
                          'a089e77c50fad921a00c74032b5a5be0',
                          'Double crunch',
                          'The double crunch is a bodyweight exercise focused on the muscles of the core, the rectus abdominis or "six-pack" muscles in particular. It''s a very simple exercise that involves "crunching" the knees and elbows toward each other using the abdominal muscles, while keeping the back flat against the ground.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          104,
                          'bbf0107bc554eb581b3d36ce8b6c8508',
                          'Flutter kick',
                          'The flutter kick is a core exercise where the legs are held off the ground as you flutter your feet over and under each other in small motions. It targets multiple muscles of the core, but particularly the rectus abdominis or "six-pack" muscles. It can be performed for time or reps in the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          105,
                          '159bbde518b523bde0141d5fda3dc4f3',
                          'Sprawl',
                          'The sprawl is an explosive bodyweight exercise that targets the core, upper body, and lower body. It is similar to a burpee, but without a jump at the top and with a plank instead of a push-up at the bottom. It can be performed for time or reps in any fat-loss or athleticism-focused circuit or workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          106,
                          'ee5d4718acf384dd2b218e585890046d',
                          'Spider plank jack',
                          'The spider plank jack is a bodyweight core exercise that begins in a straight-arm plank, then combines a spider crunch and a plank jack into a single sequence. It can be performed as bodyweight core training or for conditioning in a fat-loss or athleticism-focused circuit.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          107,
                          '6dec62f5fbb01af7941b76433f9d7bc2',
                          'Banded jumping jack',
                          'The banded jumping jack takes a classic plyometric exercise and adds an extra degree of difficulty in the form of a band surrounding the thighs, just above the knees. It can be performed for time or reps and is a great way to warm up for athletics or lower-body lifting.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          108,
                          '521f92f5f8fc88411ac1dec5ca2a44a2',
                          'Shin hug',
                          'The shin hug is a bodyweight exercise focused on the muscles of the core. It shares characteristics with V-ups and crunches, but finishes with the ribs touching the thighs. It can be performed for time or for reps as part of the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          109,
                          'b060b3a17198e6458fbd9b7912ceb1ce',
                          'Bear crawl up-down',
                          'The bear crawl up-down is a variation of the bear crawl that involves lowering the forearms to the ground in an alternating rhythm while in a static bear crawl hold. It adds an extra coordination and upper-body challenge to an already intense full-body movement that targets the cardiovascular system as well as a wide range of muscle groups. It can be done as a full-body warm-up, or as part of a bodyweight circuit or flow.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          110,
                          '3f468136a348cc3a3581cffedef29f83',
                          'Bear crawl hold',
                          'The bear crawl hold is a static variation of the bear crawl exercise performed for time. It looks simple, but it demands full-body tension and is taxing to the shoulders, core, and legs. It can be done as a full-body warm-up, as part of a bodyweight circuit or flow, or as a build-up to the traditional bear crawl.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          111,
                          '5c7572622f47f224c40f9ac6255cc9b2',
                          'Traveling bear crawl',
                          'The traveling bear crawl is a more advanced version of the bear crawl exercise that moves side to side rather than front to back. While it looks simple, the traveling bear crawl is an intense full-body movement that targets the cardiovascular system as well as a wide range of muscle groups, the shoulders, core, and legs in particular. It can be done as a full-body warm-up, in short bursts for power or circuit training, or for longer durations as cardiovascular conditioning.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          112,
                          '0496d6723dd551bb56c43667fb4d0e54',
                          'Single-leg V-up',
                          'The single-leg V-up is a bodyweight exercise that targets the abdominals and the hip flexors, working one side of the body at a time. It can be performed for time or reps in the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          113,
                          '976471484648c5db7e7484124773e1b5',
                          'Alternating single-leg sprawl',
                          'The alternating single-leg sprawl is an explosive bodyweight exercise that targets the core, upper body, and lower body. It differs from a standard sprawl by including a single-leg plank instead of a regular plank at the bottom. It can be performed for time or reps in any fat-loss or athleticism-focused circuit or workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          114,
                          'c9832b78a76ba4cde8ee47a7e891fadb',
                          'Wide mountain climber',
                          'The wide mountain climber is a popular bodyweight exercise targeting the muscles of the core, as well as the shoulders, hips, and cardiovascular system. It is different from a traditional mountain climber because you bring the knee to the outside of the elbow rather than the inside. It can be performed for time or reps as part of a dynamic warm-up, for bodyweight cardio or conditioning, or as no-equipment dynamic core training.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          115,
                          '5c1e82757c3fef269a1eec53be95c7de',
                          'Plank leg raise',
                          'The plank leg raise is an isometric abdominal exercise that targets the muscles of the core, the deep core or transversus abdominis in particular. It also targets the muscles of the glutes and hips. It can be performed for time or reps in the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          116,
                          '6b94e2f9add5dbf723cf3cccecdf7520',
                          'Glute bridge step-out',
                          'The glute bridge step-out is a lower-body bodyweight exercise that targets the glutes and hamstrings. It differs from a glute bridge by the addition of a step-out, which increases stress on the hamstrings. It can be performed for time or reps and works perfectly in a dynamic warm-up for lower-body training, but can also be performed for glute activation anytime.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          117,
                          '6837aaca602d155c82caffe97f63701f',
                          'Knee up-down',
                          'The knee up-down is a bodyweight exercise that mimics getting up and down from a kneeling position on the floor. It combines the low position of a squat with lunges, bringing some of the benefits of both. It can be done for time or reps as part of a dynamic warm-up or as part of a bodyweight circuit or workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          118,
                          '0f8d5e40de066f59ea410e638437a85b',
                          'Reach crunch',
                          'The reach crunch is a bodyweight core exercise that involves keeping the arms raised toward the ceiling while performing a crunch. It can be performed for time or reps as part of any abs-focused circuit or workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          119,
                          '14fbe78a0a6bcdd1ad7a21424e2f8ca7',
                          'V-up plus knee-to-chest combo',
                          'The V-up plus knee-to-chest combo is a core exercise that targets the abdominals and hip flexors by combining two movements into a single sequence. It can be performed for time or reps in the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          120,
                          'faeaf27e41121d3322d084bbfddf1f6a',
                          'Side plank lateral raise',
                          'The side plank lateral raise is an exercise that combines an isometric side plank hold with a dumbbell raise to target both the core and the shoulders. You probably won''t be able to use much weight without disrupting your balance, but even at light weight, this is a movement that can help address multiple muscle groups in a time-efficient workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          121,
                          '78a6f52ab790fa03b6c8af51d5c6ac43',
                          'Superhero burpee',
                          'The superhero burpee is an advanced variation of the burpee exercise. The main difference between this and the standard burpee is that while on the floor, the hands are extended in front of the body like Superman taking flight. This increases the challenge to the upper back and shoulders. These can be performed for time or reps as part of any fat-loss or athleticism-focused workout or circuit.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          122,
                          '5f540762804ac05b2fc629826a73dacb',
                          'Hollow-body abduction',
                          'The hollow-body abduction is an isometric core exercise that includes leg abductions for an added challenge to the core and abductors. It targets multiple muscles of the core, but particularly the rectus abdominis or "six-pack" muscles. It can be performed for time or reps in the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          123,
                          '8121a4fe8125a10650b9952b8909598d',
                          'Tip-toe crunch',
                          'The tip-toe crunch is a variation on the crunch exercise that involves placing the toes on or near the ground. This can help isolate the abs from the hip flexors. The tip-toe crunch can be performed for time or for reps as part of the core-focused component of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          124,
                          'cb0cefc505cea5fdcb462cdd9c44d8b6',
                          'Knee-to-nose pulse',
                          'The knee-to-nose pulse is a bodyweight exercise that targets the core by pulsing your knee toward your nose. It starts in a straight-arm plank position, and is similar to a mountain climber, but with a hold or pause in the bent-knee position.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          125,
                          '08f2729f19762837c47e0c41d760e852',
                          'Plank walk-out',
                          'The plank walk-out is an advanced plank variation targeting the core and shoulders. From a standing position, the lifter descends into a plank-type position but “walks” the hands forward until they are out in front of the head. This is far more challenging to the core than having the arms directly under the shoulders. Beginners will need to progress to this exercise.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          126,
                          'fe93b60b9cc4655851a49092f414416f',
                          'Long sit-up',
                          'The long sit-up is an advanced version of the sit-up exercise that is performed with the hands reaching over the head. This lengthens the torso, making it harder for the abs to contract and lift the upper body. Long sit-ups can be performed for time or for reps, with the feet anchored or free.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          127,
                          'c50b1fbd49f34c6e39857d76b26817f6',
                          'Seated leg lift',
                          'The seated leg lift is a bodyweight exercise targeting the muscles of the core and hip flexors. It can be performed for time or reps in the core-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          128,
                          '619b0584d0d63a40f2603b2f464c5e16',
                          'Gorilla burpee',
                          'The gorilla burpee is a variation of the burpee exercise that consists of a reverse lunge on each leg, a full squat, then a standard burpee. It is extra challenging for the lower body, including the quads, glutes, and hamstrings. It can be performed for time or reps in any fat-loss or athleticism-focused circuit or workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          129,
                          '4ad362a570157b2f249e8d5b7e741da3',
                          'Bear crawl push-up',
                          'The bear crawl push-up is a variation of the bear crawl hold with a push-up added. It adds an extra coordination and shoulder challenge to an already intense full-body movement that targets the cardiovascular system as well as a wide range of muscle groups, the shoulders, core, and legs in particular. It can be done as a full-body warm-up, or as part of a bodyweight circuit or flow.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          130,
                          '1dcb2d0503c7f70756186a2950515fdd',
                          'Plank reach',
                          'The plank reach is an exercise targeting the entire core, particularly the oblique muscles. It resembles a plank exercise, but the primary difference is that the lifter extends their arms forward, one at time. The core, especially the obliques, must work hard to maintain stability. It can be performed for time, with holds in the reaching position, or for reps.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          131,
                          '6bd90407709d2973b9afc6a921a5dbef',
                          'Eiffel Tower leg raise',
                          'The Eiffel Tower leg raise is a bodyweight exercise targeting the muscles of the abs, the rectus abdominis or “six-pack” muscles in particular. It is similar to a V-up, but with the added challenge of “drawing” a pyramid shape in the air with the legs during each rep. It can be performed for time or reps in the core-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          132,
                          '0e49ba14e803e096a09c5023304081e8',
                          'Straight-arm plank',
                          'The straight-arm plank is an exercise targeting the core muscles. It is basically the top of a push-up position, with elbows fully extended and palms on the floor. The position is held for time to target the muscles of the core, as well as the shoulders.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          133,
                          'f3a95358c8172e380390d548c93b0475',
                          'Plank up-down',
                          'The plank up-down is a variation of the plank push-up that ends in an elbow plank rather than with the chest on the ground. It involves transitioning between the two positions one arm at a time, rather than two. It puts more stress on the triceps and core than traditional planks. It can be performed for time or reps in any bodyweight workout or during the core-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          134,
                          '4cd05672cb11b93c22c870dfe1a32d4f',
                          'Frog kick',
                          'The frog kick is an explosive bodyweight movement that involves hopping the rear legs up and forward from a straight-arm plank position. It targets the legs, core, and shoulders, but is also a high-intensity conditioning movement that will raise core body temperature and burn serious calories. It can be performed for time or reps as part of any athleticism-focused or fat-loss circuit or workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          135,
                          '5c94ef81a8f42a2fdf4082af5b04b79a',
                          'Front kick-through',
                          'The front kick-through is a full-body movement that involves moving the legs from a bear crawl position to a balanced one-legged stance. It is commonly performed for reps or time in bodyweight circuits and animal-style flows, but can also work on its own or as part of a dynamic warm-up or mobility sequence.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          136,
                          'ea84a05aa2e310632305bd830d3c4ab3',
                          'Butterfly crunch',
                          'The butterfly crunch is a popular bodyweight exercise that targets the rectus abdominis, or "six-pack" muscles. It gets its name from the position of the elbows and knees, both of which are bent out like wings. It can be performed for time or reps as part of any abs-focused circuit or workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          137,
                          '41af46a885d78764f00f6607c7b73541',
                          'Cross-body mountain climber',
                          'The cross-body mountain climber is a popular bodyweight exercise targeting the muscles of the core, as well as the shoulders, hips, and cardiovascular system. It is different from a traditional mountain climber because you bring the knee to the opposite side of the body rather than simply to the chest. It can be performed for time or reps as part of a dynamic warm-up, for bodyweight cardio or conditioning, or as no-equipment dynamic core training.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          139,
                          '20c3e37efc0285e6da8953d707cb7328',
                          'Hanging alternating single-leg raise',
                          'The hanging alternating single-leg raise is an exercise targeting the abs, but which also works the lats and hip flexors. Rather than performing both legs at a time, you lift one and alternate with each rep. Leg raises are often performed for moderate to high reps, such as 8-12 reps or more, as part of ab-focused training. However, this difficult variation may require some time to build up to those rep ranges.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          141,
                          'f5225255cd076789dc3e4cc43474fc91',
                          'Alternating lying leg raise',
                          'The alternating lying leg lift is a popular bodyweight exercise targeting the muscles of the abs, the rectus abdominis or “six-pack” muscles in particular. It can be performed for time or reps in the core-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          142,
                          '7104ff2bbd718a153a22a5f66c03f211',
                          'Decline leg lift',
                          'The decline leg lift is a popular bodyweight core exercise targeting the rectus abdominis or "six-pack" muscles, particularly the lower abs. It can be performed for time or for reps as part of the core-focused portion of any workout or circuit.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          143,
                          'ad449094fd0783e2a15e12ac2baa3e48',
                          'Barbell floor wiper',
                          'The barbell floor wiper is a core exercise in which the barbell is held in the locked-out position of a floor press, and the hips and legs are rotated side to side. It targets the oblique muscles of the lateral abdomen, but is also seriously challenging to the deep core and rectus abdominis or "six-pack" muscles.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          144,
                          'de97732c6fc68ff628a5aed3b6af691b',
                          'Cross-body toe-touch',
                          'The cross-body toe-touch is a version of the toe-touch stretch where instead of both hands reaching down toward both feet, one hand at a time reaches for the opposing foot. It''s a common component in dynamic warm-ups for training or sports, but can also be performed for simple flexibility work anytime.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          145,
                          '2c04540525b6013b76cb154cfe9b54da',
                          'Toy soldier',
                          'The toy soldier is a calisthenics exercise targeting the hip flexors and legs, which are kicked up one at a time. When each leg is at the top of the kick, the opposing hand touches that foot. It''s a common warm-up exercise before athletics, but can also help raise core temperature and mobilize a wide range of muscles and joints prior to training.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          146,
                          '4675db59874643258f26d4399a747505',
                          'Lateral ape',
                          'The lateral ape is an exercise focused on the lower body that involves staying in a low squat position as you hop laterally. It can be performed as part of a dynamic warm-up, to improve hip mobility, or as part of a fat-loss or athleticism-focused circuit workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          147,
                          '346c96526f17ee755a5c692f1ccab12a',
                          'Hollow-body knee tuck',
                          'The hollow-body knee tuck is a bodyweight abdominal exercise performed on the floor. It is similar to both the hollow-body hold and the knee tuck or reverse crunch, combining elements of both. It primarily targets the muscles of the rectus abdominis, or “six-pack” muscles. It can be performed for reps or time, either as part of an ab-focused workout or as a component of a circuit workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          148,
                          '2150edce9722e7bd83613d5905eadd73',
                          'Hanging crunch',
                          'The hanging crunch an abdominal exercise that targets the rectus abdominis or "six-pack" muscles. It can be performed hanging from a bar, on a dip station or parallel bars, or if grip strength is a limitation, by placing the elbows in ab straps. If hanging from a straight bar is uncomfortable to the wrists or shoulders, you can also perform them hanging with a neutral grip (palms facing one another). It is similar to a hanging knee raise, but with more spinal curling and a more pronounced "crunch" at the top.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          150,
                          '5a2e12177485b592cb163006d3104757',
                          'Bird dog',
                          'The bird dog is a core exercise designed to help strengthen and stabilize the posterior chain. It involves lifting an opposite-side arm and leg while in a bent-leg tabletop position. It is most commonly performed as part of a dynamic warm-up, or for mobility and muscle activation anytime.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          151,
                          '2631d2890efe5143e7b485d20dce4aff',
                          'Single-leg curl up',
                          'The single-leg curl up is a bodyweight abdominal movement that teaches and reinforces abdominal “bracing” for strength training. It is usually performed along with variations of the bird dog and side plank as the “McGill big three.” The curl up can be performed for time or for reps, with or without pauses at the top position, as part of a warm-up or the core-focused component of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          153,
                          'd11fa9a4068332e096b66f78518d01df',
                          'Ab wheel roll-out',
                          'The ab wheel roll-out is an exercise targeting the abdominals using an inexpensive wheel device with a handle on either side. Many trainers and strength coaches claim it''s one of the best exercises for developing strength in the midsection. Beginners may have to start with a limited range of motion or just wheel planks.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          154,
                          '9f63686e892e9980e1bcd2b8986ee030',
                          'Bench mountain climber',
                          'The bench mountain climber is a bodyweight exercise that works the core, shoulders, and lower body while burning a lot of calories. Placing the hands on an elevated surface such as a bench decreases the challenge to the shoulders, allowing lifters to focus their work on the other body parts. Mountain climber variations are usually performed at a fast pace for moderate to high reps, such as 8-12 reps per leg or more.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          155,
                          '918c4178ca776d98911e0c44964ed379',
                          'Feet-elevated bench side plank',
                          'The feet-elevated bench side plank is an advanced version of the side plank performed with the feet elevated on a bench. It targets the same muscles as the side plank, including the obliques, shoulders, and lateral hips, but the body angle makes it more difficult than side planks on the floor. Most lifters will need to progress to this version after mastering the basic side plank first.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          156,
                          'cad74ff49667837a7d0cc2f30c136b1d',
                          'Cross-body sit-up',
                          'The cross-body sit-up is a bodyweight exercise targeting the ab muscles, the obliques and rectus abdominis or "six-pack" muscles in particular. It involves bringing the opposite-side knee and elbow together, usually alternating sides with each rep. It can be performed for time or reps as part of the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          157,
                          '4675eb2a55530b31ceb7a367c2e8f78b',
                          'Decline kayak',
                          'The decline kayak is a core exercise targeting the obliques. It involves making a paddling motion on a decline bench with the feet anchored, using a bar or pipe for weight. It is usually performed for moderate to high reps, at least 8-12 reps per side, as part of the ab-focused portion of a workout or circuit.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          158,
                          '47e9ed3d8c4837da4ba657f2348319f0',
                          'Decline sit-up twist',
                          'The decline sit-up twist is a bodyweight core exercise that targets the obliques, as well as the rectus abdominis or "six pack" muscles. Sit-up variations are usually performed for moderate to high reps, such as 10-15 reps per set or more, as part of the core-focused portion of a workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          159,
                          'fbe2ce7cda33c4a7217abeb3148f993f',
                          'Chin-up crunch',
                          'The chin-up crunch is an exercise targeting the core and overall upper-body strength. It combines a chin-up with a knee raise or crunch to give extra emphasis to the core.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          160,
                          '65479280505f1c08673068a19ae84a96',
                          'Half Turkish get-up',
                          'The half Turkish get-up is a kettlebell movement that focuses on the first portion of the Turkish get-up exercise. It is often taught as a precursor to the full Turkish get-up, but is also a valuable abdominal and shoulder exercise in its own right. It can be performed for reps or time, either in lower rep ranges for strength or higher rep ranges for technique practice or conditioning.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          161,
                          '665b262f6f78641b9fb67be11c1c2c34',
                          'Parallel bars knee raise',
                          'The parallel bars knee raise is a bodyweight exercise that targets the abs. It is performed on parallel bars, starting in the top position of a dip. Knee raises are often performed for moderate to high reps, such as 8-12 reps or more, as part of ab-focused training.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          162,
                          'c2b78784b8ce84b61e0adc11c26472b6',
                          'Parallel bars leg raise',
                          'The parallel bars leg raise is a bodyweight exercise that targets the abs. It is performed on parallel bars, starting in the top position of a dip. Leg raises are often performed for moderate to high reps, such as 8-12 reps or more, as part of ab-focused training. However, this difficult variation may require some time to build up to those rep ranges.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          163,
                          'c323e6c0728082985829f78af01f1bf9',
                          'Spider crunch',
                          'The spider crunch is a core exercise that begins in a straight-arm plank position and involves raising one knee toward your same-side elbow to target the obliques. It is similar to a mountain climber, but with the knees out wider. It can be performed for time or reps as bodyweight ab training or conditioning.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          164,
                          '60b5c4794a8cc3df5f93fafe11dbf1dc',
                          'Toe-touch',
                          'The toe-touch is a bodyweight movement that targets the muscles of the abs, the rectus abdominis or "six-pack" muscles in particular. It can be performed for time or reps in the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          165,
                          'f0e77358e78979733665bb23ae44e913',
                          'Cocoon crunch',
                          'The cocoon crunch is a bodyweight exercise targeting the ab muscles, the rectus abdominis or "six-pack" muscles in particular. It involves bringing your knees to your chest and your arms from overhead to center. It can be performed for time or reps as part of the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          166,
                          '4d89f0d556c2b4c10f8b7406dec15a8d',
                          'Bench oblique crunch',
                          'The bench oblique crunch is an exercise that targets the obliques, the muscles running alongside the rectus abdominis. The range of motion is fairly small, but it still does a great job of working these hard-to-isolate muscles. Like most crunch variations, it is usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          167,
                          '8ef11fc79d2450d36b6c2f725eafc135',
                          'Full Moon',
                          'The full moon is a bodyweight exercise targeting the muscles of the abs. It is similar to a V-up, but with the added challenge of “drawing” a circle shape in the air during each rep. It can be performed for time or reps in the core-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          168,
                          '3d76aa6749f8a26fe5e96c34b0604a21',
                          'Active hang from bar',
                          'The active hang from bar is a static exercise that involves isometrically squeezing the shoulders into the sockets and activating the muscles of the upper back and core. It can be used to improve pull-up form or to do more pull-ups, but also has postural and shoulder health benefits.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          169,
                          'c324e9bed5e95b54ba3d84566aaed854',
                          'Cat-cow',
                          'Cat-cow is a traditional yoga pose that is also popular in fitness and strength training. It targets spinal mobility and control of the vertebral column. It can be performed for time or reps as part of a dynamic warm-up or as a mobility or restorative exercise anytime. It can also work as part of a yoga or bodyweight sequence with other poses.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          170,
                          '8235ff1ba957bd71aae875ebca6e7c1a',
                          'Crab walk',
                          'The crab walk is a full-body exercise that has been popular in schools and gym classes for decades. It''s a full-body coordination challenge that also burns serious calories, making it an excellent inclusion in a full-body warm-up or bodyweight circuit workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          171,
                          '3a0086ddddc98b73041e27daa41c3d9a',
                          'Lunge with overhead reach',
                          'The lunge with overhead reach is a full-body bodyweight movement targeting the quads and shoulders. It has both strength and mobility benefits and can be performed one leg at a time or alternating for time or for reps.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          172,
                          'f06a224c99fbf4b25079e8a637d14217',
                          'Hang from bar',
                          'The hang from bar is a static exercise that involves hanging from a bar by two hands. It can either be an "active hang," where you pack the shoulders and activate the muscles of the upper back, or a "passive hang," where you let the shoulders unpack and let the muscles of the upper body stretch. A passive hang may not be appropriate for all people depending on their shoulder health, but many coaches believe hanging can be healthy for the shoulders when done properly.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          173,
                          '8624a4302a50b8d0311ae3e4c26345f9',
                          'Side plank pulse',
                          'The side plank pulse is a dynamic version of the side plank exercise focusing on the oblique muscles, as well as the transversus abdominis or deep core muscles. It can be performed for time or reps and can work in a warm-up or in the core-focused portion of any workout.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          174,
                          '6c10b3dc49b4b166d7503a482e845239',
                          'Hand shift plank',
                          'The hand shift plank is a progression of the straight-arm plank exercise where you maintain a plank position as you shift your hands side to side. The additional movement forces the core muscles to work harder to stabilize.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          175,
                          '6ffbf4463364683354b1c7ec025c39cf',
                          'Cross-body plank march',
                          'The cross-body plank march is an exercise targeting the entire core but especially the obliques. It’s more difficult than a standard plank, with the extra stabilization challenge of bringing one knee at a time off the ground toward the opposing elbow. This will increase the challenge to the core and shoulder muscles, but also present a coordination and balance challenge.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          176,
                          '3ffdf2dc12b69878b2d70ae8c4168629',
                          'Bent-knee Copenhagen hip adduction',
                          'The bent-knee Copenhagen hip adduction is an advanced exercise that combines the isometric stabilization of the Copenhagen plank with dynamic adductions to challenge the core stabilizers and adductors. This exercise targets the same muscles as the side plank, including the obliques, shoulders, and lateral hips, but places extra emphasis on the adductors and is more difficult than side planks on the floor. Most lifters will need to progress to this version after mastering the basic side plank or Copenhagen plank first.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          177,
                          'c3e154f56cafeb9961e9698f46c8b93e',
                          'Copenhagen plank',
                          'The Copenhagen plank is an advanced version of the side plank performed with one foot on a bench and the other foot hovering under it. This exercise targets the same muscles as the side plank, including the obliques, shoulders, and lateral hips, but places extra emphasis on the adductors and is more difficult than side planks on the floor. Most lifters will need to progress to this version after mastering the basic side plank or feet-elevated side plank first.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          178,
                          '5dc6d484048791ceb52068f93ff44787',
                          'Alternating hanging knee raise',
                          'The alternating hanging knee raise is an exercise targeting the abs, but which also works the lats and hip flexors. Rather than performing both legs at a time, you lift one knee at a time and alternate with each rep as if marching in place. Knee raises are often performed for moderate to high reps, such as 8-12 reps or more, as part of ab-focused training.',
                          'Strength',
                          8,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          179,
                          '8010f237dca3b45501c28fc31f47fc5f',
                          'Dumbbell suitcase crunch',
                          'The dumbbell suitcase crunch is a weighted version of a popular abdominal training exercise. The simple addition of a weight makes the suitcase crunch far more difficult, helping build the "six pack" muscles and providing a different stimulus to the core during training.',
                          'Strength',
                          9,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          180,
                          'eafd101e15c4df792b59d9220bffa277',
                          'Medicine ball rotational throw',
                          'The medicine ball rotational throw is an explosive exercise targeting the abdominals, including the obliques, as well as the hips and upper back. It involves standing sideways to the wall and twisting the torso to hurl a medicine ball into the wall, then catching the ball on the ricochet. It can be performed for lower reps with a focus on power, or for higher reps with a focus on fat loss and conditioning.',
                          'Strength',
                          9,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          181,
                          'd9522d8a5e8eb0639a1e2041c023f346',
                          'Hollow-hold ball toss',
                          'The hollow-hold ball toss is a more difficult version of the hollow-body hold exercise. It involves tossing a ball to a partner while maintaining an isometric hold in the hollow-body position. It can be done for reps or time in any ab-focused workout, or in an "I go, you go" format.',
                          'Strength',
                          9,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          182,
                          '672b3364bff6d5d6c5c414c00ba0e631',
                          'Medicine ball half moon',
                          'The medicine ball half moon is a dynamic core exercise performed around and over a medicine ball or other short, stationary object. It is similar in some ways to a V-up or reverse crunch, and targets both the obliques and the rectus abdominis or "six-pack" muscles. It can be performed for reps or for time, usually in dedicated ab training or as part of a medicine ball and bodyweight circuit workout.',
                          'Strength',
                          9,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          183,
                          '24013eb61f7827e040fec50d803cd43f',
                          'Exercise ball roll-out',
                          'The exercise ball roll-out is an exercise that strengthens the core, shoulders and upper- back muscles. It starts in a plank-style position, with the arms resting on a ball. Then, roll the ball out in front of you as far as you can while maintaining a strong, neutral spinal position. The lack of stability from the ball increases the degree of difficulty. This is a difficult movement, and beginners may need to use a limited range of motion.',
                          'Strength',
                          9,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          184,
                          'e20bb4da811b4109d406def13228a1ed',
                          'Medicine ball pass',
                          'The medicine ball pass is a simple partner-based exercise that involves throwing a weighted ball back and forth. It can be part of a dynamic warm-up for lifting or athletics, but can also work as active rest or as a component of circuit training.',
                          'Strength',
                          9,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          185,
                          'a52c9284832768edb24cfb85adbd0c74',
                          'Medicine ball Russian twist',
                          'The medicine ball Russian twist is a weighted version of a popular abdominal training exercise. It targets the oblique muscles, as well as the deep muscles of the core and the rectus abdominis or "six pack" muscles. It can be done for reps or time in the ab-focused portion of any workout.',
                          'Strength',
                          9,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          186,
                          'b2802ffc44f55ece460fc25ebea6bbc2',
                          'Medicine ball twist',
                          'The medicine ball twist is an exercise targeting the abdominal muscles, particularly the obliques. It is similar in many ways to a Russian twist exercise. The ball is held tight to the chest throughout the movement, and then the torso is rotated from side to side for the desired number of reps or a set amount of time.',
                          'Strength',
                          9,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          187,
                          '5f6706bd480aff2ee04be0376623a8e3',
                          'Decline oblique crunch',
                          'The decline oblique crunch is a popular bodyweight exercise targeting the obliques and the rectus abdominis or "six-pack" muscles. It is usually performed for high reps, such as 10-15 reps per set or more, as part of the ab-focused portion of a workout.',
                          'Strength',
                          10,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          188,
                          'd19721ff0a56016ebd49dd939107a77b',
                          'Decline sit-up',
                          'The decline sit-up is a bodyweight core exercise that works the rectus abdominis or "six pack" muscles. Sit-up variations are usually performed for moderate to high reps, such as 10-15 reps per set or more, as part of the core-focused portion of a workout.',
                          'Strength',
                          10,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          189,
                          'd6e7f9aa06dfce73da2db960e0322483',
                          'Hanging Windshield Wiper',
                          'The hanging windshield wiper is an advanced abdominal training exercise that is also extremely challenging to other muscles of the upper body, including the lats (latissimus dorsi), biceps, and grip. It requires—and builds—great strength in the rectus abdominis or "six-pack" muscles, as well as the obliques and deep core muscles. If you can''t perform it hanging from a bar, the lying windshield wiper on the floor provides some of the same benefits.',
                          'Strength',
                          10,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          190,
                          '59f322b9f9079802fdec1dcb868dbc9c',
                          'Exercise Ball Pull-In',
                          'The exercise ball knee roll-in is an abdominal exercise that involves supporting yourself with your hands in a plank or push-up position and drawing the knees in toward the chest. This is a fairly advanced abdominal move requiring core strength.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          191,
                          'd4a690123fb60d80c040d945eaf1bc6d',
                          'Exercise ball crunch',
                          'The exercise ball crunch is a popular gym exercise targeting the abdominals. Unlike crunches on the floor or a bench, by using a ball you can increase the range of motion and both stretch and contract the abs on every rep. The ball crunch can be performed for low reps with a slower tempo focusing on a hard contraction, or for higher reps.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          192,
                          '2ec8d3c3cfb659adf2a1c95b71ddbd19',
                          'Feet-elevated crunch',
                          'The feet-elevated crunch is a variation on the basic crunch, a very popular ab move. Resting the feet on a bench takes some of the hip flexor activation out of the movement, focusing the stress more on the abs. It may have a small range of motion, but this movement produces a major burn.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          193,
                          '28ce12f56dfef113b0ad3ff0473a3d55',
                          'Swiss Ball Ab Roll-Out',
                          'The exercise ball roll-out is an exercise that strengthens the core, shoulders and upper- back muscles. It starts in a plank-style position, with the arms resting on a ball. Then, you roll the ball out in front of you as far as you can while maintaining a strong, neutral spinal position. The lack of stability from the ball increases the degree of difficulty. This is a difficult movement, and beginners may need to use a limited range of motion.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          194,
                          'bc73f7d5696ed6a2163ed3f63032b435',
                          'Exercise ball squat and twist',
                          'The exercise ball squat and twist is a combination exercise targeting the quads, but also the obliques because of the twisting motion with each repetition. The exercise ball is held close to the chest throughout. Because it is a lightweight movement, it is usually performed for high reps or for time, and can be a great part of a bodyweight and exercise ball circuit.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          196,
                          'a1d8706f08ab7b95ea0eed70d7d30a88',
                          'Exercise ball pike',
                          'The exercise ball pike is a challenging move that targets the core. It involves thrusting the hips into full flexion over a ball, then extending out to a foot-elevated plank with the feet on the ball. It''s a challenging move from a strength perspective, but also for balance. It can be the centerpiece of an ab workout or go along with other body weight or ball movements in an ab circuit.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          197,
                          'aa8c3f17cfb0f327a2723dad3616a646',
                          'Exercise ball bird dog',
                          'The exercise ball bird dog is a dynamic movement focusing on the glutes and the postural muscles of the upper back. When performing it, use an exercise ball that is tall enough to support your chest and core, but short enough to allow your hands and knees to reach the ground. It is slightly easier than a bodyweight bird dog and can work as a regression for that movement. It can be done for time or reps as part of a warm-up, paired with movements in a workout, or as a mobility or recovery exercise.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          198,
                          '160ce183cf1f6345f521e742469c1297',
                          'Exercise ball superman',
                          'The exercise ball superman is a slightly more advanced variation of the bodyweight superman exercise. It targets many muscles along the posterior or backside of the body, including the rear deltoids, trapezius, spinal erectors, glutes, and hamstrings. It can be done for time or reps as part of a warm-up, paired with movements in a workout, or as a mobility or recovery exercise.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          199,
                          'e6e038f3f7bb281ed8eeb32dc83ed15c',
                          'BOSU cross-body crunch',
                          'The BOSU cross-body crunch is a dynamic abdominal exercise performed on a BOSU ball or other stability training device. It targets several of the muscles in the core, including the obliques and the rectus abdominis or "six-pack" muscles. It is usually performed in alternating reps, either for time or a number of reps, as part of an ab-focused workout or a circuit involving body weight or the BOSU ball.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          200,
                          '75a7a00313ac1415384d15d2cb5faad1',
                          'BOSU knee tuck',
                          'The BOSU knee tuck is a dynamic abdominal movement performed on a BOSU ball or other stability training device. It primarily targets the rectus abdominis or "six-pack" muscles of the core. It can be performed for time or reps as part of an ab-focused workout or a circuit involving body weight or the BOSU ball.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          201,
                          'e3cc805e3024e5b9117bbc79599af4ac',
                          'Hanging exercise ball leg raise',
                          'The hanging exercise ball leg raise is an exercise targeting the abs and hip flexors. Instead of resting the forearms on the pads of an apparatus, it''s performed hanging from a bar with an exercise ball held between the legs.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          202,
                          '9aad4e542ed05a04f33dcaadd9b3ce4e',
                          'Feet-elevated plank on ball',
                          'The feet-elevated plank is a variation on the straight-arm plank, a bodyweight standard. The feet are elevated on a ball to align the body parallel to the floor and provide a greater stabilization challenge. This makes it more difficult than straight-arm planks on the floor, but also puts more emphasis on the shoulder muscles. It is often used as a shoulder and core warm-up, or as a burnout movement for a chest or shoulder workout.',
                          'Strength',
                          11,
                          1,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          203,
                          'd6d7050be53017612474f6871008debe',
                          'Thigh adductor',
                          'The thigh adductor machine is a lower-body exercise that targets the muscles of the inner thighs. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of lower-body training.',
                          'Strength',
                          7,
                          2,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          204,
                          'd19f861784df3eb9cadd734eaacac9bd',
                          'Thigh abductor',
                          'The thigh abductor is a lower-body exercise that targets the muscles of the outer hips and glutes. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of lower-body training.',
                          'Strength',
                          7,
                          3,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          205,
                          'd46a5919007169d3e43280cda5181574',
                          'Dynamic pigeon stretch',
                          'The dynamic pigeon stretch is a lower-body stretch targeting the glutes, hips, and piriformis. It is influenced by the pigeon pose from yoga, but involves moving in and out of the pose. It can be part of a dynamic warm-up or mobility work performed anytime.',
                          'Strength',
                          8,
                          3,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          206,
                          '137d420d398f5977d8a7e3c2c5787c05',
                          'Cross-over jack',
                          'The cross-over jack is a variation on the jumping jack, a popular calisthenics exercise used to improve overall conditioning. The difference between the jumping jack and the cross-over jack is that with the latter, the feet don''t just come together each rep, they cross over each other. It''s a great way to add variety to your warm-up or conditioning work.',
                          'Strength',
                          8,
                          3,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          207,
                          '2f04e21518472981f58553286ee60a5a',
                          'Traveling thigh killa',
                          'The traveling thigh killa is a challenging lower-body bodyweight exercise that builds muscular endurance with a series of hops forward and backward, as well as bodyweight squats. It can be performed for time or reps, usually in a circuit workout or as a lower-body finisher.',
                          'Strength',
                          8,
                          3,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          208,
                          '82d038321daf378630512123c799eb8e',
                          'Side-lying leg adduction scissor',
                          'The side-lying leg adduction scissor is a dynamic core exercise that combines the isometric hold of a side-lying leg lift with leg adductions to further challenge the core and adductors. It targets multiple muscles of the core, primarily the rectus abdominis or "six-pack" muscles. It can be performed for time or reps in the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          2,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          209,
                          'e91c537175ed512e4e6db150ea58b5e1',
                          'Incline dumbbell biceps curl',
                          'The incline dumbbell biceps curl is an exercise targeting the biceps and performed face up on an incline bench. This creates a vertical arm angle, which helps to isolate the biceps and limit involvement of the shoulder muscles. This curl variation is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or arm-focused training.',
                          'Strength',
                          1,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          210,
                          'fe917bdb5e3f7b580ad246f1fb7a4a0c',
                          'Banded biceps curl in squat position',
                          'The banded biceps curl in squat position is an exercise targeting the biceps, although it also works the core and lower body.',
                          'Strength',
                          1,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          211,
                          '0ae913e9cde8053fa2012228ef7f9068',
                          'Band standing concentration curl',
                          'The band standing concentration curl is a variation of a popular biceps-focused exercise utilizing a band instead of a dumbbell. It allows you to focus on one biceps at a time and really squeeze out intense peak contractions. Band concentration curls are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          1,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          212,
                          '772aa93b3976691babc7e8fcdc1303e2',
                          'Wide-grip barbell curl',
                          'The wide-grip barbell curl is a variation of the classic barbell curl with the grip wider than shoulder width. It is thought that this helps build the inner or "short" head of the biceps muscles. This movement is usually performed for moderate to high reps, such as 8-12 reps per set.',
                          'Strength',
                          2,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          213,
                          'eb80a226c1f62d4e9530c3e80ed99fba',
                          'EZ-bar spider curl',
                          'The EZ-bar spider curl is an exercise targeting the biceps and performed face down on either an incline bench or on the flat side of a preacher bench. The EZ-bar makes for a more comfortable wrist position, while the angle helps to isolate the biceps and limit involvement of the shoulder muscles. This curl variation is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or arm-focused training.',
                          'Strength',
                          2,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          214,
                          '58f1328ac6f1f6ae1679d64e85ff0512',
                          'Barbell Curl',
                          'The barbell curl is an arm exercise that is also one of the most recognizable movements in all of bodybuilding and fitness. It helps build sleeve-popping biceps and allows heavier loading than many other curl variations. It is usually performed in moderate to high reps, such as 8-12 reps per set, as part of the arm-focused portion of any workout.',
                          'Strength',
                          2,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          215,
                          '5c972eca57b728b066ddd2eb346c323a',
                          'Close-grip EZ-bar curl',
                          'The close-grip EZ-bar curl is an exercise targeting the biceps, particularly the long head. The main difference between this exercise and standard EZ-bar curls is that the hands are positioned closer together on the bar. It is thought that this helps build the outer biceps head and the peak. This curl variation is usually performed for moderate to high reps, such as 8-12 reps per set.',
                          'Strength',
                          2,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          216,
                          'd19fa591226381b3b91cb99a105a51d7',
                          'Preacher Curl',
                          'The EZ-bar preacher curl is a classic exercise for building bigger biceps. This move is all about isolation. With the back of the upper arms against the pad, it’s next to impossible to cheat. Go light, get a great pump, and build that peak!',
                          'Strength',
                          2,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          217,
                          'f24364ed3fa7728d1b4ce99e6cdfcc40',
                          'Close-grip barbell curl',
                          'The close-grip barbell curl is a curl variation where the hands are closer than shoulder width. It is thought that this helps build the outer biceps head and the peak. This curl variation is usually performed for moderate to high reps, such as 8-12 reps per set.',
                          'Strength',
                          2,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          218,
                          '8243d3fa929febb4ddb232bacf9235a9',
                          'Drag curl',
                          'The drag curl is a biceps exercise that attempts to remove the influence of the front deltoids on the classic curl. With the elbows kept back, the barbell "drags" up the torso. It is usually performed for moderate to high reps, such as 8-15 reps per set, as part of an upper-body or arms-focused workout.',
                          'Strength',
                          2,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          219,
                          'cba96298361036ea3d56890bfeec7a79',
                          'Reverse-grip barbell curl',
                          'The reverse-grip barbell curl is a variation on the biceps curl where the palms face downward. The switch from an underhand to an overhand grip brings the forearm and brachialis muscles more into the exercise. If it is uncomfortable to the wrists, try performing it on the angles of an EZ-curl bar.',
                          'Strength',
                          2,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          220,
                          'e814c9b797ab85e8c5e1013f50a9f9db',
                          'Seated Straigh-Bar Curl Superset',
                          'The seated wide-grip curl to close-grip curl is a variation on the classic seated dumbbell curl. The variation is that the range of motion changes in alternating fashion—one more traditional, one where you’re bringing the weight in more from the side.',
                          'Strength',
                          2,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          221,
                          '30c172bf14b78194d226e165d4394961',
                          'Reverse-grip EZ-bar curl',
                          'The reverse-grip EZ-bar curl is an exercise targeting the biceps and forearms. Because grip strength is a limitation with this move, it is often performed for moderate to high reps as part of an upper-body or arm-focused workout.',
                          'Strength',
                          2,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          222,
                          '8b2dc4d3e039ec73de9d32ae75fc890b',
                          'Standing band biceps curl',
                          'The standing band biceps curl is an arm-focused exercise using a band for resistance. This variation is usually performed for moderate to high reps as part of an arms-focused or upper-body workout.',
                          'Strength',
                          2,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          223,
                          'b396c8efd45806ec64558826eb6665ba',
                          'EZ-bar preacher curl',
                          'The EZ-bar preacher curl is a classic exercise for building bigger biceps. This move is all about isolation. With the back of the upper arms against the pad, it''s next to impossible to use momentum which forces the muscles to work harder.',
                          'Strength',
                          2,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          224,
                          '96eba2ab74a164f37f07b1b90c9bf0c1',
                          'Concentration curl',
                          'The concentration curl is a classic exercise for building the biceps one arm at a time. It can be performed bent over or kneeling, but is more often performed seated on a bench. It''s great for emphasizing the biceps peak and is often used to finish a biceps workout. Like most curl variations, these are usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          225,
                          'a956501dd867379e44395c749b0b3fb3',
                          'Dumbbell Bicep Curl',
                          'The dumbbell biceps curl is a single-joint exercise for building bigger and stronger biceps. Popular among gym goers of all experience levels, this move can be done seated or standing. It is generally performed for moderate to high reps, such as 8-12 reps or higher, as part of the arm-focused portion of a workout.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          226,
                          'dcad9de8cfbaa3d3c36e86b9348ed325',
                          'Cross-body hammer curl',
                          'The cross-body hammer curl is a dumbbell exercise that targets the biceps, brachialis, and forearm muscles. Rather than lifting the weights directly in front of the body, you lift them across the torso. Throughout each rep, the wrists remain neutral, like a carpenter hammering a nail. This helps isolate the brachialis muscles on each arm. It is generally performed for moderate to high reps, such as 8-12 reps or more, as part of the arm-focused portion of a workout.',
                          'Strength',
                          4,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          227,
                          'a4ef207f2a265d348f5b7304fc813851',
                          'Dumbbell Alternate Bicep Curl',
                          'The alternating biceps curl is a single-joint exercise for building bigger and stronger biceps one arm at a time. Popular among gym goers of all experience levels, this move can be done seated or standing. It is generally performed for moderate to high reps, such as 8-12 reps or higher, as part of the arm-focused portion of a workout.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          228,
                          '21c1a9e1851482efa15e1babab7e79a4',
                          'Single-arm dumbbell preacher curl',
                          'The single-arm dumbbell preacher curl is an exercise that focuses on building the biceps, particularly the biceps peak. Most people will go light on this movement, performing it for moderate to high reps as part of an upper-body or arms-focused workout.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          229,
                          '8de18dbf208e27e70d01334613d8e7f0',
                          'Standing concentration curl',
                          'The standing concentration curl is a variation on the more common seated concentration curl, which is a staple of bodybuilding arm routines. It can serve as a substitute for preacher curl variations if a preacher bench is unavailable and is also a classic way to focus in on the biceps peak. It is usually performed for moderate to high reps, such as 8-10 reps per set, with a focus on strict form and controlled tempo.',
                          'Strength',
                          4,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          230,
                          'edbc7b1f5c8d20b91973e940ef84ed36',
                          'Alternating incline dumbbell biceps curl',
                          'The alternating incline dumbbell biceps curl is an exercise targeting the biceps and performed face up on an incline bench. This creates a vertical arm angle which helps to isolate the biceps and limit involvement of the shoulder muscles. This curl variation is usually performed for moderate to high reps, such as 8-12 rep per arm or more, as part of upper-body or arm-focused training.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          231,
                          'eb6516caf8507ffa4bf3fe93ecc3b93d',
                          'Seated dumbbell biceps curl',
                          'The seated dumbbell biceps curl is a popular exercise for building bigger biceps. While curls can effectively be performed standing as well, performing them seated can enforce strict form and perhaps boost the mind-muscle connection. Like most curl variations, these are usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          232,
                          '4ebf7c4c2602dea58ec6dc28647aa0b0',
                          'Dumbbell preacher curl',
                          'The dumbbell preacher curl is an exercise that focuses on building the biceps, particularly the biceps peak. All you need is a pair of dumbbells and a preacher bench. It''s usually performed for moderate to high reps as part of an upper-body or arms-focused workout.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          233,
                          'c0f9bae8b8f4503435f34af694d4a92e',
                          'Standing Dumbbell Reverse Curl',
                          'With the reverse-grip dumbbell curl, the palms face down, not up. This unorthodox wrist position simultaneously targets the biceps while also building forearm and grip strength. The move can performed standing or seated.',
                          'Strength',
                          4,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          234,
                          '33d1459fbd6b69ddfa25da1ce554e469',
                          'Palms-out incline biceps curl',
                          'The palms-out incline biceps curl is an exercise targeting the biceps. It is largely similar to the incline dumbbell curl, but the palms-out position targets the long head of the biceps, which is responsible for the biceps "peak." This curl variation is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or arm-focused training.',
                          'Strength',
                          4,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          235,
                          'feaa9541086ad6dd8988db0f0ee9d464',
                          'Straight-arm plank with biceps curl',
                          'The straight-arm plank with biceps curl is a hybrid movement that trains the abdominal and biceps muscles simultaneously. It can address multiple muscle groups in a time-efficient muscle-building or circuit-style workout, while also providing an additional cardiovascular challenge.',
                          'Strength',
                          4,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          236,
                          '8635628dc87f575cb5f249815f568710',
                          'Face-down incline dumbbell biceps curl',
                          'The face-down incline dumbbell biceps curl is an exercise targeting the biceps and performed face down on an incline bench. This creates a vertical arm angle, which helps to isolate the biceps and limit involvement of the shoulder muscles. This curl variation is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or arm-focused training.',
                          'Strength',
                          4,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          237,
                          '8605f607695a4db51f6a52ad6d8bb6f2',
                          'Seated hammer curl',
                          'The seated hammer curl is a popular exercise for building bigger biceps and forearms. The movement resembles hammering a nail—hence the name. While curls can effectively be performed standing as well, performing them seated can enforce strict form and perhaps boost the mind-muscle connection. Like most curl variations, these are usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          238,
                          '109a9e87e54daa8d16868eecd4ed3cb4',
                          'Dumbbell overhead hold with single-arm curl',
                          'The dumbbell overhead hold with single-arm curl combines an isometric overhead hold with a curl for the other arm. The two movements collectively target the muscles of the shoulders and arms, while providing a surprising core challenge. Expect to be challenged, even with light weight.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          239,
                          'e241431841b78818dd2ba04eaca0f811',
                          'Lunge hold dumbbell curl',
                          'The lunge hold dumbbell curl is a challenging complex that combines an isometric hold at the bottom of a lunge with a dumbbell biceps curl. The two exercises combine to target the legs, core, and biceps. The curl will determine the amount of weight you can use, but even a light weight will make the lunge hold seriously challenging.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          240,
                          '48e9ec0739c6f4ac5a6281a7355d3b1f',
                          'Alternating dumbbell snatch',
                          'The alternating dumbbell snatch is an explosive exercise that builds full-body power and targets the muscles of the hips, back, and shoulders. Performing it by alternating arms gives each arm the chance to recover, allowing you to do a greater amount of quality work. It can be performed for low reps with a focus on power and speed, or for higher reps to build muscle or as part of a metabolic conditioning circuit.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          241,
                          '1640b34b3153aea04180e0c885c1c24d',
                          'Reverse-grip dumbbell curl',
                          'With the reverse-grip dumbbell curl, the palms face down, not up. This unorthodox wrist position simultaneously targets the biceps while also building forearm and grip strength. The move can be performed standing or seated. Because grip is a limiting factor, it is usually performed for moderate to high reps, such as 8-10 reps per set.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          242,
                          'f752ba77bf96abbe06d0751d1a072160',
                          'Hammer Curls',
                          'The hammer curl is a dumbbell movement that focuses on the biceps, brachialis, and forearm muscles. Throughout each rep, the wrists remain neutral, like a carpenter hammering a nail. It is generally performed for moderate to high reps, such as 8-12 reps or more, as part of the arm-focused portion of a workout.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          243,
                          '3c996e92514fdc909b3e6411d4976626',
                          'Single-arm seated dumbbell curl',
                          'The single-arm seated dumbbell curl is a popular exercise for building bigger biceps. Performing it one arm at a time may allow you to use slightly heavier weight, while focusing on really feeling the mind-muscle connection in the working arm. Like most curl variations, these are usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          244,
                          '16a770f3395ed151485ed01efc1ee18b',
                          'Seated alternating biceps curl',
                          'The seated alternating biceps curl is an exercise that builds bigger and stronger biceps. The alternating technique allows one arm to rest briefly while the other arm lifts. It is usually performed for moderate to high reps, such as 8-12 reps or more, as part of the upper-body or arm-focused portion of a workout.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          245,
                          '1dc01aea81fba9b809fc130f8b8999bb',
                          'Alternating hammer curl',
                          'The alternating hammer curl is performed with dumbbells but without wrist supination. Throughout each rep, the wrists remain neutral, like a carpenter hammering a nail. It is generally performed for moderate to high reps, such as 8-12 reps or more, as part of the arm-focused portion of a workout.',
                          'Strength',
                          4,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          247,
                          '5d1f327a2659a808243e15b4d8954185',
                          'Plate hammer curl',
                          'The plate hammer curl is an exercise that targets the long head of the biceps as well as the brachialis and brachioradialis muscles. Typically hammer curls are done with dumbbells, but in this case, holding a weight plate places the hands in the same neutral position.',
                          'Strength',
                          5,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          248,
                          'cecb0962be698bc87185b45d9ef38a90',
                          'Barbell spider curl',
                          'The barbell spider curl is an exercise targeting the biceps and performed face down on either an incline bench or on the flat side of a preacher bench. The vertical bench angle helps to isolate the biceps and limit involvement of the shoulder muscles. This curl variation is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or arm-focused training.',
                          'Strength',
                          2,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          249,
                          '9046ddf4540b79458c2ad07e41f8c395',
                          'Barbell forehead curl',
                          'The barbell forehead curl is a classic movement from the Golden Age of bodybuilding and is often associated with Dave "The Blond Bomber" Draper. The barbell is brought up to your forehead instead of to your chest, emphasizing the squeeze and peak contraction. It is usually performed for moderate to high reps, such as 8-12 reps per set.',
                          'Strength',
                          2,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          250,
                          'ae59dddd30fa3dd2a31190a7e823ea90',
                          'Overhead cable curl',
                          'Also known as a crucifix curl, the overhead cable curl is a biceps-focused exercise performed between two cable stacks, using a pair of D-handles. The arms and elbows are held at shoulder height throughout the movement, and both hands curl in toward the ears. This position is designed to eliminate shoulder involvement and momentum, while targeting the biceps peak. This movement is generally done for moderate to high reps, such as 8-12 reps per set or more, as part of arm-focused training.',
                          'Strength',
                          6,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          251,
                          'ccadb349e8d64dad006aa6332a619a63',
                          'Standing One-Arm Cable Curl',
                          'The single-arm cable biceps curl is a single-joint isolation exercise for building the biceps. This move is intended to be strict and deliberate; this is not an exercise for using momentum or otherwise cheating.',
                          'Strength',
                          6,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          252,
                          '519250c1d2420fe590216098c25bf986',
                          'Standing Biceps Cable Curl',
                          'The cable straight-bar biceps curl takes a classic bodybuilding exercise, the standing barbell curl, and replaces the barbell with a handle attached to a cable. This is a common burnout move performed for moderate to high reps, such as 8-12 reps per set, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          6,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          253,
                          'd05e71561c2c759426098dc7a6471d8c',
                          'Cable rope hammer curl',
                          'The cable rope hammer curl is a popular arm-focused exercise performed with a rope handle attached by a cable to a weight stack. It uses a neutral (palms facing one another) grip, which targets the forearms and brachialis muscles in addition to the biceps. Because grip is a limitation, it is usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          6,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          254,
                          '4abb0936dc76536294844f0f6c54ab23',
                          'Lying cable biceps curl',
                          'The lying cable biceps curl is a cable exercise that targets the biceps. It is performed lying on the back, either on a bench or the ground, with the feet facing toward a cable stack. This movement is usually performed for moderate to high reps for a burn and pump as part of an arm-focused workout.',
                          'Strength',
                          6,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          255,
                          'f1e700135f6d2ac79a1210c4c1d8209b',
                          'Cable rope preacher hammer curl',
                          'The cable rope preacher hammer curl is a single-joint arm exercise that builds strength and size in the biceps using a cable stack, a preacher bench, and a rope grip. The neutral or "hammer" grip amplifies activation of both the grip and the brachialis muscles, building arm thickness. The angle of the bench also effectively removes the shoulders from the movement, largely isolating the biceps. It is generally performed for higher reps, at least 8-15 per set.',
                          'Strength',
                          6,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          256,
                          '7be4cff5330ab0ee41011a2893743c2a',
                          'Lying Close-Grip Bar Curl On High Pulley',
                          'The lying high-cable biceps curl is an unusual move for building the biceps—but it’s a highly effective one. Lying prone and curling down toward you provides a different stimulus than more standard approaches allow.',
                          'Strength',
                          6,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          257,
                          'f5beba651d8b7937ddbeb8ef73d4650e',
                          'Squatting cable EZ-bar biceps curl',
                          'The squatting cable EZ-bar biceps curl is an exercise that builds and strengthens the biceps while the lower body is in a static squat position. It is usually performed for higher rep sets, such as 8-12 reps per set or more, in combination with other curls or arm training. It is most similar in arm positioning to a preacher curl, but has some unique benefits to the lower body, as well.',
                          'Strength',
                          6,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          259,
                          'c8781cd5def0b9f5e1d29b1b95a44f17',
                          'Standing reverse-grip cable curl',
                          'The standing reverse-grip cable curl takes a classic bodybuilding exercise, the reverse barbell curl, and tweaks it by using a handle attached to a cable stack instead. It targets the forearm muscles and brachialis to a greater degree than underhand biceps curl variations. Because grip is a limitation, this move is commonly performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          6,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          260,
                          '397863a80e70b6304f9ee69d95277272',
                          'Lying high-cable biceps curl',
                          'The lying high-cable biceps curl is a single-joint exercise targeting the biceps in a prone (face-up) position. It is usually performed for moderate to high reps as part of the arm-focused portion of a workout.',
                          'Strength',
                          6,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          262,
                          '830ae0b9b6605a5e2c7f164bd1fa7c1b',
                          'Seated cable biceps curl',
                          'The seated cable biceps curl is a single-joint arm exercise intended to isolate the biceps. The seated position helps eliminate the use of momentum. This movement is usually performed for moderate to high reps for a burn and pump as part of an arm-focused workout.',
                          'Strength',
                          6,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          263,
                          '4064527c6892c26e2d71ef7fba641755',
                          'Single-arm cable biceps curl',
                          'The single-arm cable biceps curl is a single-joint isolation exercise for building the biceps. This move is intended to be strict and deliberate; this is not an exercise for using momentum or otherwise cheating. It is usually performed for moderate to high reps, such as 8-12 reps or more per set, as part of an arm-focused workout.',
                          'Strength',
                          6,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          264,
                          '8772c1c5f6082e68d5f48b96f3f82eb9',
                          'Machine Preacher Curls',
                          'The machine preacher curl is an isolation exercise targeting the biceps.',
                          'Strength',
                          7,
                          4,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          265,
                          'c33dd76d2dfd3957c25c7803d720501a',
                          'Single-arm machine preacher curl',
                          'The single-arm machine preacher curl is a popular exercise to build size and strength in the biceps. It approximates the motion of a free-weight preacher curl, but uses a selectorized weight stack or plate-loaded machine. Many such machines offer different grips and grip widths. Machine biceps curls are often done for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or arm-focused portion of a workout.',
                          'Strength',
                          7,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          266,
                          '8b750f169b95639308e64c63bb861e06',
                          'Machine preacher curl',
                          'The machine preacher curl is a popular exercise to build size and strength in the biceps. It approximates the motion of a free-weight preacher curl, but uses a selectorized weight stack or plate-loaded machine. Many such machines offer different grips and grip widths. Machine biceps curls are often done for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or arm-focused portion of a workout.',
                          'Strength',
                          7,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          267,
                          'f1bb335c3c1cd6e18188987d37d3251a',
                          'Smith machine drag curl',
                          'The Smith machine drag curl is a biceps-focused exercise using the bar in a Smith machine. It is usually trained in moderate to high reps, at least 8-15 reps per set, and can work in the biceps-focused portion of any workout.',
                          'Strength',
                          7,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          268,
                          '299a8ab4f49cb294dbc0a8071d5e007a',
                          'EZ-Bar Curl',
                          'The standing EZ-bar curl is an immensely popular exercise targeting the biceps. It is commonly performed for moderate to high reps as part of an upper body or arms-focused workout. Many gyms even have EZ-bars at fixed weights, allowing for easy weight changes.',
                          'Strength',
                          12,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          270,
                          '8d77d187c49514b1fa1acce2fdb4bffa',
                          'Standing EZ-bar curl',
                          'The standing EZ-bar curl is a popular exercise targeting the biceps. It is commonly performed for moderate to high reps as part of an upper-body or arm-focused workout. Many gyms even have EZ-bars at fixed weights, allowing for easy weight changes.',
                          'Strength',
                          12,
                          4,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          271,
                          '03ef80d2499cfe09e3148efcc9139775',
                          'Standing barbell calf raise',
                          'The standing barbell calf raise is a popular exercise to target the calf muscles of the lower leg, particularly the gastrocnemius muscle. It can be performed for time or for reps, either using a barbell or Smith machine bar if balance is a problem.',
                          'Strength',
                          2,
                          5,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          272,
                          'd3e81c42921fa55c875adef3270823d5',
                          'Smith machine standing calf raise',
                          'The Smith machine standing calf raise is a machine-based exercise targeting the muscles of the calves, particularly the gastrocnemius or upper calf muscle. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of the lower-body portion of a workout.',
                          'Strength',
                          2,
                          5,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          273,
                          '31a02f9dd7591bd046f4ee004739c3c6',
                          'Standing Dumbbell Calf Raise',
                          'The standing dumbbell calf raise is a popular exercise to target the calf muscles of the lower leg, and in particular the gastrocnemius muscles. It can be performed for time or for reps, either two dumbbells, or one if balance is a problem and you would like to use your free hand to hold a fixed object.',
                          'Strength',
                          4,
                          5,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          274,
                          'f3d5bd197e11f485f74f4b98f1edbb28',
                          'Single-leg standing dumbbell calf raise',
                          'The single-leg standing dumbbell calf raise is a popular exercise to target the calf muscles of the lower leg, particularly the gastrocnemius muscle. It can be performed for time or for reps, either with two dumbbells or with one if balance is a problem and you would like to use your free hand to hold a fixed object.',
                          'Strength',
                          4,
                          5,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          275,
                          '5faf799024cecde89f07d816318a77f7',
                          'Dumbbell walking calf raise',
                          'The dumbbell walking calf raise is a dynamic exercise targeting the calf muscles of the lower leg, particularly the gastrocnemius muscle. It can be performed for distance or for reps.',
                          'Strength',
                          4,
                          5,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          276,
                          'cf0f952f8fee7dda1f5acd835b06718a',
                          'Weighted donkey calf raise',
                          'The weighted donkey calk raise is a strength and muscle-building exercise focused on the muscles of the lower leg, most prominently the gastrocnemius muscle. While traditional donkey calf raises involved either a specific machine or carrying another person on one''s back, this method uses a weight belt. It can be done in traditional muscle-building rep ranges, or for higher reps as part of lower-body training.',
                          'Strength',
                          5,
                          5,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          277,
                          'd8f28e46641417e3480163508ef3a060',
                          'Single-leg machine seated calf raise',
                          'The single-leg machine seated calf raise is an exercise targeting the calf muscles of the lower leg, particularly the soleus muscle. It is usually performed for moderate to high reps, such as 8-12 reps per set, but occasionally for higher reps of 20 per set or more.',
                          'Strength',
                          5,
                          5,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          279,
                          '38757cce6dfe23f7663c6ac2479f84a6',
                          'Standing Calf Raises',
                          'The standing calf raise is a popular movement to target the calf muscles of the lower leg, and in particular the gastrocnemius muscles. When unweighted, it is usually performed for high reps or for time.',
                          'Strength',
                          7,
                          5,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          280,
                          'bfaec672476ef8eaae6c9631d5511c90',
                          'Seated Calf Raise',
                          'The machine seated calf raise is an exercise targeting the calf muscles of the lower leg, particularly the soleus muscle. It is usually performed for moderate to high reps, such as 8-12 reps per set, and occasionally for very high burnout-focused sets of 50-100 total reps.',
                          'Strength',
                          7,
                          5,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          281,
                          '707505f6b929aaa81fec408bb13ccc50',
                          'Calf Press On The Leg Press Machine',
                          'The leg press calf raise is an exercise that uses the leg press machine to work the calves. With the toes and balls of your feet on the platform but heels off, you push forward to work the calves.',
                          'Strength',
                          7,
                          5,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          283,
                          '8a895011147eb545d39a9aaf409e46fb',
                          'Hack squat calf raise',
                          'The hack squat calf raise is a variation of the standing calf raise performed in a hack squat machine. This allows for heavy loading, but also shoulder comfort from the pads of the hack squat. Calf raise variations are often performed for relatively high reps, such as 10-20 reps per set or more.',
                          'Strength',
                          7,
                          5,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          284,
                          '91dea301660ab20320601cd8b4663186',
                          'Leg press calf raise',
                          'The leg press calf raise is a variation of the standing calf raise performed in a leg press machine. This allows for heavy loading, but also shoulder comfort from the pads of the leg press. Calf raise variations are often performed for relatively high reps, such as 10-20 reps per set or more.',
                          'Strength',
                          7,
                          5,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          287,
                          '06908ae0f671bc13fed6b9a6831c046c',
                          'Standing calf raise-',
                          'The standing calf raise is a popular movement to target the calf muscles of the lower leg, particularly the gastrocnemius muscle. When unweighted, it is usually performed for high reps or for time.',
                          'Strength',
                          8,
                          5,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          288,
                          'da2aad50dd9cc0d23fe05398df82b96d',
                          'Incline band bench press',
                          'The incline band bench press is variation of the incline press, a popular upper-body exercise targeting the upper pectoral muscles. While it can be a strength-focused movement, it is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or chest-focused training.',
                          'Strength',
                          1,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          289,
                          '54bf1dc849f321b014846962c8ae0d63',
                          'Band push-up',
                          'The band push-up is a progression of the popular bodyweight version of the exercise commonly used in military and tactical physical fitness tests. Adding the dynamic resistance of the band matches the strength curve of the push-up and helps build upper-body muscle and strength, emphasizing the chest, triceps, and shoulders, but also working the upper back and core.',
                          'Strength',
                          1,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          290,
                          'edb66888ede26af0ad8e0019cce0258e',
                          'Band chest fly',
                          'Similar to the cable chest fly, the band chest fly is a single-joint movement that works the pectoral muscles. The fly is common in upper-body and chest-focused muscle-building workouts, and the band variation works well as a pre-exhaust at the beginning of a workout or a finishing movement at the end. It is often used in combination with other presses or flyes to target the chest from different angles.',
                          'Strength',
                          1,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          291,
                          '8d7b9c7fbf7b88cb8119689dc7b532fb',
                          'Close-grip bench press',
                          'The close-grip bench press is a popular exercise targeting the triceps and chest. The main difference between this exercise and the standard bench press is that the hands and elbows are placed closer together, which places more of an emphasis on the triceps. The close-grip bench press is often used as an accessory movement for the traditional bench press, or as a triceps builder for arm training. Similar to the bench press, it can be trained in low reps for strength or higher reps for muscle or strength endurance.',
                          'Strength',
                          2,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          292,
                          '0b4f68dadc10de491eaefbf0b24e7b14',
                          'Barbell Bench Press - Medium Grip',
                          'The bench press is a compound exercise that builds strength and muscle in the chest and triceps. When many people think of listing, the bench press is often the first exercise that comes to mind',
                          'Strength',
                          2,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          293,
                          '24275779a1ae7729110cd61bd3b36852',
                          'Decline barbell bench press',
                          'The decline barbell bench press is a popular upper-body exercise targeting the lower pectoral muscles. While it can be a strength-focused movement, it is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or chest-focused training.',
                          'Strength',
                          2,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          294,
                          '83122afd7f4c7c6fa0e7f904c7284ade',
                          'Wide-grip bench press',
                          'The wide-grip bench press is a compound exercise targeting the chest and, to a lesser extent, the triceps. The main difference between this exercise and the standard bench press is that the hands are placed farther apart on the bar. Many lifters find they can handle more weight going wide than with narrower grips, although it''s also worth noting that plenty of banged-up lifters have said benching with a wide grip may also have contributed to their shoulder injuries and pain. The wide-grip bench is often used as a chest-building movement in chest or upper-body workouts, or as an accessory movement for the traditional bench press.',
                          'Strength',
                          2,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          295,
                          '0b9d29436009c56d3a6624c08db11173',
                          'Barbell Incline Bench Press Medium-Grip',
                          'The incline bench press is an upper body compound movement that targets the upper chest.',
                          'Strength',
                          2,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          296,
                          'c76a758845c3d2d2072d7260241801d1',
                          'Barbell Bench Press-Wide Grip',
                          'The wide-grip bench pressis a compound exercise targeting the chest, primarily. The main difference between this exercise and the standard bench press is that the hands are placed wider apart on the bar.',
                          'Strength',
                          2,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          297,
                          '16f7f02b842b7c4776114ad4498a8ac1',
                          'Incline bench press',
                          'The incline bench press is a popular barbell exercise targeting the chest muscles, particularly the upper pectoral muscles. While it can be a strength-focused movement, it is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or chest-focused training.',
                          'Strength',
                          2,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          298,
                          'da0e9ec96d16b9dde7f4de364dad97c9',
                          'Bench press',
                          'The bench press is a popular barbell exercise that builds strength and muscle in the chest, triceps, and shoulders. It is a popular way to measure overall upper-body strength, and is contested in the sport of powerlifting. When many people think of lifting, the bench press is often the first exercise that comes to mind. It can be performed for low reps for strength, higher reps for muscle, or for higher reps to build or measure strength endurance, like in the 225-pound bench press rep test in the NFL combine.',
                          'Strength',
                          2,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          299,
                          'e43a08abc6fb5f8cf961c699a86b1602',
                          'Spoto press',
                          'The Spoto press is a variation of the popular barbell exercise the bench press that builds strength and muscle in the chest, triceps, and shoulders. It differs from the bench press in that the lifter pauses for a few seconds at the bottom of the movement before pressing the bar back up. This pause removes all momentum and increases the time under tension for the chest and shoulder muscles to help develop upper-body musculature and strength.',
                          'Strength',
                          2,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          300,
                          '991a81e0ccd3d489c3d2c5c5c4deb977',
                          'Kettlebell plyo push-up',
                          'The kettlebell plyo push-up is an explosive upper-body movement that uses a kettlebell primarily as a platform for the hands. A short step, dumbbell, or other stationary object could also be used in place of the kettlebell. It can be performed for reps or time, either for low reps to build explosive power or for higher reps for conditioning.',
                          'Strength',
                          3,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          301,
                          '5c7ca7271c8b5d71bce1d3d49380dfbe',
                          'Kettlebell alternating floor press',
                          'The kettlebell alternating floor press limits the range of motion you would achieve with a dumbbell or kettlebell bench press, but still targets the chest, triceps, and anterior delts. This allows you to build strength in the top portion of the lift, overload the triceps, and work on strengthening the shoulder stabilizers.',
                          'Strength',
                          3,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          302,
                          '9d427808480d09f2efd2833e8968ccd3',
                          'Band-suspended kettlebell bench press',
                          'The band-suspended kettlebell bench press is a bench press variation where kettlebells or weight plates are hung from the ends of a barbell by looped bands. The suspended weights can be in addition to normally loaded weight plates, or in the place of them. Because the instability of the weights makes the lift difficult, this bench press variety is a popular accessory movement for building the traditional bench press in powerlifting training.',
                          'Strength',
                          1,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          303,
                          '0ad26a659d650e984cc51b6380980e61',
                          'Incline Push-Up',
                          'The hands-elevated push-up is a variation on the push-up, a body-weight standard. The hands are elevated, so that your body is aligned at an angle to the floor rather than parallel.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          304,
                          '98e7c3522d04989e8d570a0ac2035930',
                          'Hands-elevated push-up',
                          'The hands-elevated push-up is a variation on the classic push-up where the hands are placed on a bench or other elevated surface. Having the hands higher than the feet makes it easier than push-ups on the floor, but also puts the emphasis more on the triceps. It can be used as a substitute for floor push-ups or as a mechanical dropset after maxing out on floor push-ups.',
                          'Strength',
                          8,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          305,
                          '1bdd40515844b0ce961c3db50dbdcf6f',
                          'Decline Push-Up',
                          'The feet-elevated push-up is a variation on the push-up, a body-weight standard. The feet are elevated, so that your body is aligned at an angle to the floor rather than parallel.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          306,
                          '1d99618e1b8eb1fd81085ac1a23dc95b',
                          'Wide-grip hands-elevated push-up',
                          'The wide-grip hands-elevated push-up is a variation on the elevated push-up performed with the hands farther apart than with a standard push-up. Having the hands higher than the feet makes it easier than wide-grip push-ups on the floor, but the extra width also puts more emphasis on the chest muscles. It can be used as a substitute for wide-grip floor push-ups, or as a mechanical dropset after maxing out on floor push-ups.',
                          'Strength',
                          8,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          307,
                          '1e16ba369be2ce79a07ff52ae8ec9e22',
                          'Feet-elevated push-up',
                          'The feet-elevated push-up is a variation on the push-up, a bodyweight standard. The feet are elevated so that your body is aligned at an angle to the floor rather than parallel. This makes it more difficult than push-ups on the floor, but also puts more emphasis on the shoulder muscles. It is often used as a bodyweight substitute for incline presses, or as a burnout movement for a chest or shoulder workout.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          308,
                          '2abb0356fc8a7c915cccc83b54233977',
                          'Isometric Wipers',
                          'The typewriter push-up is an advanced push-up variation where the hands are extra wide and you lower toward each hand in alternating reps. It is more challenging to each working arm than traditional push-ups and also stretches and challenges the chest.',
                          'Strength',
                          8,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          309,
                          'd3caea53997039584c69b6d8a738d8ed',
                          'Clock push-up',
                          'The clock push-up is a series of regular push-ups performed one at a time, moving your hands one step to the side between each one until you''ve completed a full circle. It targets the same muscles as traditional push-ups, such as the chest, triceps, and shoulders, but adds an endurance and core challenge to traditional push-ups.',
                          'Strength',
                          8,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          310,
                          '930255d20b3920469b7371ad36313456',
                          'Push-Up Wide',
                          'The wide push-up is a variation of the push-up with the hands wider than shoulder-width apart. It targets upper-body muscle groups including the chest, shoulders, and triceps, but has more of a chest emphasis than narrower-grip push-up variations. If wide push-ups lead to pain in the front of your shoulder, opt for a narrower version.',
                          'Strength',
                          8,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          311,
                          'b4fe6adc2a1bbf341bc02929da242867',
                          'Sphinx push-up',
                          'The sphinx push-up is a difficult variation of the push-up that ends with the forearms on the ground in front of the body, rather than with the chest on the ground. It puts more stress on the triceps than traditional push-ups. It can be performed for time or reps in any bodyweight workout or during any arms-focused portion of a workout.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          312,
                          'e1ffd263fbd8c1cc3e19202c1f1a85fe',
                          'Close-Hands Push-Up',
                          'The close push-up is an upper-body exercise that targets the chest, triceps, and shoulders. The close hand position places more emphasis on the triceps.',
                          'Strength',
                          8,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          313,
                          '7b8badfd62c11dc48feab8b0675ca31e',
                          'Tiger-bend push-up',
                          'The tiger-bend push-up is an advanced push-up variation where you shift onto your forearms at the bottom position and then back onto your hands and up again. It targets the triceps far more than regular push-ups.',
                          'Strength',
                          8,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          314,
                          '55c69ef52381de97bc03b5b6ac3d8575',
                          'Close-grip hands-elevated push-up',
                          'The close-grip hands-elevated push-up is a variation on the classic push-up where the hands are placed on a bench or other elevated surface. Having the hands higher than the feet makes it easier than close-grip push-ups on the floor, but also puts the emphasis more on the triceps. It can be used as a substitute for floor push-ups or close-grip push-ups, or as a mechanical dropset after maxing out on floor push-ups.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          315,
                          'da29897fc75c07d76d48395cbb309dc1',
                          'Suspended push-up',
                          'The suspended push-up is a bodyweight pushing exercise performed on a suspension strap system or gymnastic rings. It targets the chest, shoulders, and triceps, but is also challenging to the core and upper back. It can work in traditional strength and muscle-building rep ranges or for higher reps.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          316,
                          '14d7dfcec76dcc4cb3c33506dec4ce25',
                          'Side-to-side push-up',
                          'The side-to-side push-up is a variation of the push-up exercise where you side-step the opposite hand and foot and perform a push-up.',
                          'Strength',
                          8,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          318,
                          '0a80ee36ecc211c7033c70c71afa074b',
                          'Diamond push-up',
                          'The diamond push-up is an advanced variation of the push-up exercise performed with the hands in a diamond shape. It increases the challenge to the triceps, but also targets the chest and shoulders.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          319,
                          '4ba76b3bc90dc5610f534d93928dd858',
                          'Judo push-up',
                          'The judo push-up is an advanced push-up variation that blends elements of the yoga poses downward- and upward-facing dog. This movement increases the demands on the shoulders, but also has mobility benefits. It can work in a dynamic warm-up or mobility-focused workout, but also in bodyweight strength training.',
                          'Strength',
                          8,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          321,
                          'ac66ab744f9aac3eb7c254d1accb2fa0',
                          'Staggered push-up',
                          'The staggered push-up is a variation of the push-up exercise where your hand position is staggered, with one hand forward and one back. It targets the same muscles as a traditional push-up, including the chest, triceps, and shoulders, but is more difficult to the rear arm and core.',
                          'Strength',
                          8,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          322,
                          '5304c29bfcda683ca1a33661bcdfcd06',
                          'Reverse-grip hands-elevated push-up',
                          'The reverse-grip hands-elevated push-up is a bodyweight exercise performed on a Smith machine or other elevated surface. It targets the chest, triceps, and shoulders. It can work as a regression of floor reverse-grip push-ups, or in a progressive mechanical dropset moving the bar up once you reach failure at a lower height.',
                          'Strength',
                          8,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          323,
                          'd8af435a657a889a42b403ba211b5236',
                          'Side kick-through push-up',
                          'The side kick-through push-up is a full-body movement that begins in a bear crawl position and ends with a leg kicked out to the side, with a push-up performed between kick-throughs. It is commonly performed for reps or timed bodyweight circuits and animal-style flows, but can also work on its own or as part of a dynamic warm-up or mobility sequence.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          324,
                          'f2a6b14a434816959435fadda86fd4f2',
                          'Frog push-up',
                          'The frog push-up is an advanced push-up variation that is performed with the legs bent and butt in the air. It heavily targets the triceps and shoulders, but is also quite challenging to the core.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          325,
                          'ee612134395f0a3cef07f3179d97920d',
                          'Wide push-up plank hold',
                          'The wide push-up plank hold is a full-body exercise targeting the core. Because the arms aren''t directly under the body, it can be more difficult than traditional push-up planks, especially for the upper back and chest, but also for the core.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          327,
                          'c1f328620c9510f724c9889e5d048b05',
                          'Push-ups',
                          'The push-up is a popular bodyweight exercise that is commonly used in military and tactical physical fitness tests. It’s a classic movement to build upper-body muscle and strength, emphasizing the chest, triceps, and shoulders, but also working the upper back and core.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          328,
                          '15d1b406cd8335d02fa3c2716845f288',
                          'Scapular push-up',
                          'The scapular push-up is an upper-body exercise aimed at increasing the stability of the scapulae and mobility in the shoulders. It is often performed as part of a dynamic warm-up before an upper-body workout, or as part of a mobility session.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          329,
                          '9f59b4fe1df4561eac119190082f6ff8',
                          'Warrior push-up',
                          'The warrior push-up is a series of push-up and plank variations combined into a single sequence. They include a Judo push-up, plank, side plank, mountain climber, diamond push-up, and regular push-up. Done together, they tax the upper-body muscles from different angles and increase time under tension for the entire body.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          330,
                          '2a2bb276f926cd8944440907cc1467a6',
                          'Cross-over push-up',
                          'The cross-over push-up is a variation of the push-up that adds a degree of difficulty by stepping over a small box or step between repetitions. It can be performed for time or for reps and creates a greater core stabilization challenge by forcing the core muscles to maintain the a neutral spine throughout the movement.',
                          'Strength',
                          8,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          331,
                          '5452d63ee69e258597f66ac44166032f',
                          'Butterfly',
                          'The machine chest fly is an exercise targeting the chest. The motion is often compared to bear-hugging a tree trunk. In chest workouts, this exercise often follows compound moves such as the bench press.',
                          'Strength',
                          7,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          332,
                          '72948063e62c45a2399d5c1fe6f55164',
                          'Leverage Chest Press',
                          'The machine chest press is an upper body exercise targeting the pectoral muscles.',
                          'Strength',
                          7,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          333,
                          '47aae70ba7befd13ce8b0a143c4e6a98',
                          'Decline Smith Press',
                          'The Smith machine decline bench press is a machine-based exercise targeting the chest muscles, particularly the lower pectoral muscles. The Smith machine mimics a barbell but provides more stability. This movement is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of a chest or upper-body workout.',
                          'Strength',
                          7,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          334,
                          'b607479ac40062c2c167bed31403ba10',
                          'Smith machine bench press',
                          'The Smith machine bench press is a machine-based movement targeting the chest. The Smith machine mimics a barbell but provides more stability. This movement can be programmed in low reps for strength or higher reps for muscle and strength endurance. It is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of a chest or upper-body focused workout.',
                          'Strength',
                          7,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          335,
                          'ce9a0a0443eba448d3719d434a01f712',
                          'Machine chest press',
                          'The machine chest press is a machine-based exercise targeting the chest. It approximates the motion of a bench press but is usually performed facing forward and seated upright. Many machines offer multiple grip options, such as overhand, neutral (palms facing), or underhand. The chest press is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of a pre-exhaust or muscle-building upper-body workout.',
                          'Strength',
                          7,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          336,
                          '4c2cdba800369be9edab88ae401f98f2',
                          'Smith Machine Incline Bench Press',
                          'The Smith machine incline bench press is a machine-based movement targeting the chest, particularly the upper chest. The Smith machine mimics a barbell but provides more stability. This movement can be programmed in low reps for strength or higher reps for muscle and strength endurance. It is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of a chest or upper-body focused workout.',
                          'Strength',
                          7,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          337,
                          'b77aacb18385c67e47dcf3e71d8e89a1',
                          'Smith Machine Close-Grip Bench Press',
                          'The Smith machine close-grip bench press is a machine-based movement targeting the chest and triceps. The Smith machine mimics a barbell but provides more stability. This movement can be programmed in low reps for strength or higher reps for muscle and strength endurance. It is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of a chest, arms, or upper-body focused workout.',
                          'Strength',
                          7,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          339,
                          'bbd1d7417b473a99095030da13dfe15d',
                          'Smith machine bench press throw',
                          'The Smith machine bench press throw is an exercise that helps develop pushing power that carries over to the traditional bench press. It involves pushing a relatively light weight (such as 30-50 percent of your 1RM) explosively and actually letting go at the top of the rep. It can work as power or speed-style training in a strength or athleticism-focused workout plan.',
                          'Strength',
                          7,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          340,
                          '170afa24ffcddfdca4ff3c504b4d3ff6',
                          'Machine chest fly',
                          'The machine chest fly is a machine-based exercise targeting the chest. It approximates the motion of a dumbbell fly or cable fly, but is usually performed facing forward and seated upright. The motion is often compared to bear-hugging a tree trunk. The chest fly is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of a pre-exhaust or muscle-building upper-body workout.',
                          'Strength',
                          7,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          341,
                          '48d33f5bc193b4916038c98c3f0022c2',
                          'Machine bench press',
                          'The machine bench press is a machine-based exercise targeting the chest and upper body. It approximates the motion of a bench press, but uses a selectorized weight-stack or plate-loaded machine. Many such machines also allow you to choose between different grips and grip widths. Machine-based presses are often done for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or chest-focused portion of a workout.',
                          'Strength',
                          7,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          342,
                          '321be5f5d8202f0cbc71287f6851806a',
                          'Smith machine weighted push-up',
                          'The Smith machine weighted push-up is a pushing movement performed with a plate resting on the back or shoulders. It is performed most safely with a foot or so of space at the bottom to minimize the risk of getting "pinned" under the bar. It targets all the same muscles as a push-up, including the chest, triceps, and shoulders.',
                          'Strength',
                          7,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          343,
                          'a5435d48ebbff8f8b264700d4aa54227',
                          'Smith machine push-up',
                          'The Smith machine push-up is an upper-body exercise targeting the chest, shoulders, and triceps. It is similar in form to bodyweight push-ups, but with the hands on the bar of the Smith machine. This allows you to vary the height to increase or decrease difficulty, or to perform a mechanical dropset by raising the bar after hitting failure at a certain height.',
                          'Strength',
                          7,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          344,
                          'c58879ad7793a42ae64daa8428ec4c84',
                          'Low-cable cross-over',
                          'The low-cable cross-over is an isolation movement that uses a cable stack to target the upper portion of the pectoral muscles. It is common in upper-body and chest-focused muscle-building workouts, often in combination with presses or flyes from other angles to target all portions of the chest.',
                          'Strength',
                          6,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          345,
                          '9de41ff73bf815ec2abcff0e677531cf',
                          'Incline cable chest fly',
                          'The incline cable chest fly is an isolation movement that uses a cable stack and an incline bench to target the upper portion of the pectoral muscles. It is common in upper-body and chest-focused muscle-building workouts, often after pressing movements like the barbell or dumbbell bench press or as a finishing movement at the end of the workout. It is often used in combination with other flyes to target the chest from different angles.',
                          'Strength',
                          6,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          346,
                          'd6f7bb823f2868f42ee5a16eaf945132',
                          'Incline cable chest press',
                          'The incline cable chest press is a pressing movement that uses a cable stack and an incline bench to target the upper portion of the pectoral muscles, similar to an incline dumbbell press. It is common in upper-body and chest-focused muscle-building workouts, where it can be effective as a primary movement in classic hypertrophy rep ranges, as a pre-exhaust, or as a high-rep finisher. It is often used in combination with other presses or flyes to target the chest from different angles.',
                          'Strength',
                          6,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          347,
                          '1685b7d8b6584d8280f18f9da32bf6c7',
                          'Single-arm cable cross-over',
                          'The single-arm cable cross-over is an isolation movement that uses a cable stack to build bigger and stronger pectoral muscles. Working the chest one side at a time allows you to focus on the balance between the sides of your chest and really feel the chest muscles contracting. It is common in upper-body and chest-focused muscle-building workouts, often in combination with other presses or flyes to target the chest from different angles.',
                          'Strength',
                          6,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          348,
                          '3ee61dfbf8643c334fcb1f03cd7a4c36',
                          'Cable cross-over',
                          'The cable cross-over is an isolation movement that uses a cable stack to build bigger and stronger pectoral muscles. Since it''s done using adjustable pulleys, you can target different parts of your chest by setting the pulleys at different levels. It is common in upper-body and chest-focused muscle-building workouts, often as a pre-exhaust at the beginning of a workout or a finishing movement at the end. It is often used in combination with other presses or flyes to target the chest from different angles.',
                          'Strength',
                          6,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          349,
                          '8370eb601997fab47011082565607c36',
                          'Lying cable chest fly',
                          'The lying cable chest fly is an isolation movement that uses a cable stack and a flat bench to build bigger and stronger pectoral muscles. It is common in upper-body and chest-focused muscle-building workouts, often as a pre-exhaust at the beginning of a workout or as a finishing movement at the end. It is often used in combination with other presses or flyes to target the chest from different angles.',
                          'Strength',
                          6,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          350,
                          'a975681c33cf259c061435c43c37830d',
                          'Seated cable chest fly',
                          'The seated cable chest fly is an isolation movement that uses a cable stack and an upright bench to target the pectoral muscles. Being able to brace against a seat can help you stabilize your torso and focus on isolating the pecs, feeling them stretch and contract. It is usually used in combination with other presses or flyes to target the chest from different angles.',
                          'Strength',
                          6,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          351,
                          'e17c497e7065b820742236bc55ff0938',
                          'Single-arm incline cable cross-over-',
                          'The single-arm incline cable cross-over is an isolation movement that uses a cable stack and a bench to target the upper part of the pectoral muscles. Working the chest one side at a time allows you to focus on balance between the sides of your chest and really feel the chest muscles contracting. It is common in upper-body and chest-focused muscle-building workouts, often in combination with other presses or flyes to target the chest from different angles.',
                          'Strength',
                          6,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          352,
                          '7939c34a58b19f6e1dc1d160a5ab8554',
                          'High-to-low cable chest fly',
                          'The high-to-low cable chest fly is an isolation movement that uses a cable stack to target the lower portion of the pectoral muscles. It is common in upper-body and chest-focused muscle-building workouts, often after pressing movements like the barbell or dumbbell bench press or as a finishing movement at the end of the workout. It is often used in combination with other flyes to target the chest from different angles.',
                          'Strength',
                          6,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          353,
                          '49986e66d226099dec71ec93cf6a5259',
                          'Medicine ball push-up',
                          'The medicine ball push-up is a simple way to make a classic bodyweight exercise more difficult. It targets all the same muscles as the push-up: chest, triceps, shoulders, upper back, and core. The addition of the medicine ball adds a degree of difficulty and can increase chest and triceps activation.',
                          'Strength',
                          9,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          354,
                          'da1af4815ac133977affc449694252cd',
                          'Dumbbell Bench Press',
                          'The dumbbell bench press is a mainstay of workout enthusiasts worldwide. It’s a classic move for building a bigger, stronger chest. As such, it’s often placed first in mass-building chest workouts.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          355,
                          '44bbcf83e486a15e51e51982774dce3c',
                          'Dumbbell chest fly',
                          'The dumbbell chest fly is a popular exercise that targets the pectoral or chest muscles. It attempts to isolate the chest muscles, stretching and contracting them while limiting involvement of the shoulders. Unlike a press, where the elbows bend and flex, flyes should keep a relatively consistent elbow angle. The motion is sometimes compared to "hugging a tree." Dumbbell flyes are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of a chest or upper-body focused workout.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          356,
                          '621be47e9fe91d53a81d737e9601a6ba',
                          'Incline dumbbell bench press',
                          'The incline dumbbell bench press is a popular upper-body exercise targeting the upper pectoral muscles. While it can be a strength-focused movement, it is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or chest-focused training.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          357,
                          'fb20901aeed6eaed6955e183554e07c9',
                          'Reverse-grip incline dumbbell bench press',
                          'The reverse-grip incline dumbbell bench press is an upper-body exercise targeting the pectoral muscles. Pressing with a reverse grip targets the upper chest in particular, especially when performed on an incline. This press variation is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or chest-focused training.',
                          'Strength',
                          4,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          358,
                          'bb0068bd7b4dd90bc477ec5f2c752dc0',
                          'Neutral-grip dumbbell bench press',
                          'The neutral-grip dumbbell bench press is a variation on a classic chest-building exercise where the palms face each other instead of forward. This shift puts the elbows closer to the sides, placing more emphasis on the triceps, and perhaps also the inner chest. The neutral-grip press can be performed in lower reps for strength or higher reps for muscle growth.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          359,
                          '6f4ddc67d02f984851a9520da4de752d',
                          'Decline dumbbell bench press',
                          'The decline dumbbell bench press is a popular upper-body exercise targeting the lower pectoral muscles. While it can be a strength-focused movement, it is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or chest-focused training.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          360,
                          'e4d67bb242e394f12df74cbd42865a3b',
                          'Single-arm kettlebell row',
                          'The single-arm kettlebell row is a popular muscle- and strength-building exercise that works the muscles of the back and core simultaneously. It has all the same benefits as a single-arm dumbbell row, but some people find a kettlebell more comfortable to hold during the movement.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          361,
                          '879f9819be89c2a403638c55c6faea58',
                          'Straight-arm dumbbell pull-over',
                          'The straight-arm dumbbell pull-over is an exercise that targets the muscles of the pecs, lats, and serratus anterior muscles. Performing this movement with straight arms makes it more difficult, increases the stretch on the serratus muscles and lats, and forces the core to work harder. Old-school bodybuilders would perform pull-overs with light weights for sets of 20 between sets of heavy 20-rep squats, but they are more popular today in moderate rep ranges, such as 8-12 reps per set, as part of an upper-body workout.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          362,
                          '66e5cf95748ad520bce82b15c6356a2f',
                          'Bent-arm dumbbell pull-over',
                          'The bent-arm dumbbell pull-over was a staple exercise of the "Golden Era" of bodybuilding and a favorite of Arnold Schwarzenegger himself. Done properly, the exercise targets the pecs, lats, and serratus anterior muscles. Old-school bodybuilders would perform them with light weights for sets of 20 between sets of heavy 20-rep squats, but pull-overs are more popular today in moderate rep ranges, such as 8-12 reps per set, as part of an upper-body workout.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          363,
                          'a6b6b6baa24cff36a762c7f3c6b3e1f9',
                          'Close-grip dumbbell bench press',
                          'The close-grip dumbbell bench press is a popular variation of the dumbbell bench press in which the dumbbells are held closer than shoulder width. This places more emphasis on the triceps, and perhaps also the inner chest. The close-grip dumbbell bench press can be performed in lower reps for strength or higher reps for muscle growth.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          364,
                          'd280b241fe0fdf648cc38e0749f626c1',
                          'Single-dumbbell push-up',
                          'The single-dumbbell push-up is a more difficult push-up variation where you balance your hands on the ends of a dumbbell. This simple change makes many muscle groups work harder, helping encourage muscle and strength gains across the upper body.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          365,
                          '4a0d94eacb8bd9fb5a38775aa4978ef0',
                          'Incline Dumbbell Chest Flyes',
                          'The incline dumbbell chest fly is an upper-body exercise targeting the chest. Performing it at an incline helps to target the upper chest in particular, while limiting involvement of the shoulders. Fly variations are usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          366,
                          '6ddb98593f863cb4874a6e46a0123a40',
                          'Dumbbell push-up row',
                          'The dumbbell push-up row combines pressing, rowing, and core stabilization into a single sequence. It''s popular in time-efficient strength and muscle-building workouts.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          367,
                          '4da8617c01a51f1b270d52a459d9b0ae',
                          'Decline dumbbell fly and press',
                          'The decline dumbbell fly and press is a dumbbell complex that targets the chest muscles, particularly the lower pecs. By alternating the single-joint fly with the multijoint press, you get the benefits of both and put serious stress on the chest muscles even with relatively light weight. Because the fly will be the limiting factor in weight selection, this pairing is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or chest-focused training.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          368,
                          'aaab5db25fb457e5047a2729b87944b1',
                          'Incline dumbbell fly and press',
                          'The incline dumbbell fly and press is a dumbbell complex that targets the chest muscles, particularly the upper pecs. By alternating the single-joint fly with the multijoint press, you get the benefits of both and put serious stress on the chest muscles even with relatively light weight. Because the fly will be the limiting factor in weight selection, this pairing is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or chest-focused training.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          369,
                          '705398ea7f4d399b63f6345a0018076a',
                          'Single-arm decline dumbbell bench press',
                          'The single-arm decline dumbbell bench press is an upper-body exercise targeting the pectoral muscles, particularly the lower pecs. Because balance can be an issue, this press variation is usually performed with lighter weight for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or chest-focused training.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          370,
                          '649f2e5b8c38561e484c83ab1efe441e',
                          'Single-arm incline dumbbell bench press',
                          'The single-arm incline dumbbell bench press is an upper-body exercise targeting the pectoral muscles. Because balance can be an issue, this press variation is usually performed with lighter weight for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or chest-focused training.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          371,
                          '5b997b4b41fa87e24b643d3e792bb5aa',
                          'Machine rear delt fly',
                          'The machine rear delt fly is an exercise targeting the rear head of the shoulder muscle or deltoids, as well as the muscles of the upper back. It''s sort of the reverse of the machine chest fly, and is sometimes performed on the same machine, but facing the opposite direction. Because it targets such small muscles, this exercise is usually performed with light weight for high reps, such as 10-15 reps per set or more.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          372,
                          '64ae5cf9e4057358c61792d947e2f55c',
                          'Single-arm dumbbell floor press',
                          'The single-arm dumbbell floor press is a multijoint pressing exercise performed lying on the floor, either with the knees bent or straight. It has less range of motion than a regular dumbbell bench press, but still targets the chest, triceps, and anterior delts. By performing it with one arm, you can strengthen weakness on certain sides or simply use it as a way to challenge the core more during this exercise.',
                          'Strength',
                          4,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          373,
                          '78dfa729acb52e52b1e8038b38c9ec78',
                          'Bodyweight Flyes',
                          'The double-bar roll-out chest fly is a chest exercise that utilizes two rotating barbells as "handles" for a chest fly. It targets the muscles of the chest, but is also an intense core workout. It''s a tough movement that is usually performed in the chest-focused portion of a workout.',
                          'Strength',
                          12,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          374,
                          'ea140c16938f5fc6aa3e5d25aaa5469e',
                          'Close-grip EZ-bar bench press',
                          'The close-grip EZ-bar bench press is an exercise targeting the chest, shoulders, and triceps. This move is more commonly done with a straight bar and is often only performed with an EZ-bar as part of a complex of movements such as pull-overs or skullcrushers.',
                          'Strength',
                          12,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          375,
                          '9a201d27b8ae1563438705eff79a513f',
                          'Chest dip',
                          'The chest dip is a bodyweight exercise performed on parallel bars or on a pull-up and dip station. It targets the chest, triceps, and shoulders. Dips with a chest focus are usually performed with the torso leaning forward and the elbows angled out from the torso. Dips can be performed for low reps for strength or higher reps for muscle growth.',
                          'Strength',
                          5,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          376,
                          'cc042c3be42a25405c45d0b7b0bb4332',
                          'Weighted Push-Up',
                          'The plate-weighted push-up is a simple way to make a classic bodyweight exercise more difficult. It targets all the same muscles as the push-up: chest, triceps, shoulders, upper back, and core. You can balance a plate on your upper back yourself, but it''s easier and safer to have someone else put it there. If you stack a few plates up, be sure to have a spotter close at hand.',
                          'Strength',
                          5,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          377,
                          '3747895221c4c09d93038d5db1b5e85a',
                          'Svend press',
                          'The Svend press is an exercise where the chest is targeted by performing presses while squeezing two weight plates together. It is usually performed for relatively high reps with light weights as an accessory movement to the bench press or as a burnout movement on chest day.',
                          'Strength',
                          5,
                          6,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          380,
                          '6247485572c52f09485a203baaaf737b',
                          'Feet-elevated push-up on ball',
                          'The feet-elevated push-up on ball is a variation on the push-up, a bodyweight standard. The feet are elevated on a ball to align the body parallel to the floor and provide a greater stabilization challenge. This makes it more difficult than push-ups on the floor, but also puts more emphasis on the shoulder muscles. It can be a challenging non-gym substitute for incline presses, or as a burnout movement for a chest or shoulder workout.',
                          'Strength',
                          11,
                          6,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          381,
                          '9ff41aec1f94e48aa837afc7a4cef765',
                          'Standing alternating band speed row',
                          'The standing alternating band speed row is an explosive back exercise using exercise bands. It targets the muscles of the middle and upper back, including the lats (latissimus dorsi), rhomboids, and trapezius, as well as the biceps. It can be performed for time or reps either as part of a power or speed-focused portion of a workout or as a burnout at the end of a workout.',
                          'Strength',
                          1,
                          7,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          382,
                          'f36e3e0a970c61e22177be0c043a13b5',
                          'Band roundhouse elbow',
                          'The band roundhouse elbow is an explosive rotational power exercise using exercise bands. It targets the muscles of the obliques and deep core, but also engrains full-body coordination and striking ability. It can work in an ab workout, in martial arts training, or in general strength and muscle training.',
                          'Strength',
                          1,
                          7,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          383,
                          '0941480045b1a9a9993d497d5b596fbd',
                          'Palms-down wrist curl over bench',
                          'The palms-down wrist curl over bench is an exercise targeting the forearms. It is usually performed for high reps, such as 10-15 reps per set or more, as part of a grip or arm-focused workout.',
                          'Strength',
                          2,
                          7,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          384,
                          'a12ade5e0856bfd4342a2746f5b9d751',
                          'Palms-up wrist curl over bench',
                          'The palms-up wrist curl over bench is an exercise targeting the forearms. It is usually performed for high reps, such as 10-15 reps per set or more, as part of a grip or arm-focused workout.',
                          'Strength',
                          2,
                          7,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          385,
                          'a655a8cdb7c9631c30ec0e13388261b1',
                          'Standing behind-the-back wrist curl',
                          'The standing behind-the-back wrist curl is a popular exercise to target the muscles in the forearms, wrists, and fingers. It is generally performed for moderate to high reps, such as 8-15 reps per set, and can work as isolated forearm training or as part of an arms-focused workout.',
                          'Strength',
                          2,
                          7,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          386,
                          'b13ff2110495f34e5f7ee51816239de0',
                          'Seated finger curl',
                          'The seated finger curl is an exercise targeting the muscles of the hands and forearms. It is popular with rock climbers and other athletes looking to build forearm size and strength. The range of motion is tiny, but done for moderate to high reps, these will definitely make the forearms burn.',
                          'Strength',
                          2,
                          7,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          387,
                          '5277f325b26c851f7062c1152ab8463e',
                          'Seated palms-up wrist curl',
                          'The seated palms-up wrist curl is an exercise targeting the forearms. It is usually performed for high reps, such as 10-15 reps per set or more, as part of a grip or arm-focused workout.',
                          'Strength',
                          2,
                          7,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          388,
                          '7427937e9be195def545f7a40182d1cb',
                          'Seated palms-down wrist curl',
                          'The seated palms-down wrist curl is an exercise targeting the forearms. It is usually performed for high reps, such as 10-15 reps per set or more, as part of a grip or arm-focused workout.',
                          'Strength',
                          4,
                          7,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          389,
                          'd9e2fc1623d14bb4304205a9403a138c',
                          'Dumbbell suitcase carry',
                          'The dumbbell suitcase carry is similar to a dumbbell farmer''s carry, but only uses one dumbbell rather than two. This simple change provides a significant challenge to the abdominal muscles. It can be a challenging finisher to any workout, or work well in fat-loss circuit training or as an accessory movement to heavy lifts like the deadlift.',
                          'Strength',
                          4,
                          7,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          390,
                          'ae99296aee6e4d01bcbc0fe3f433be26',
                          'Suitcase Dumbbell Carry',
                          'The dumbbell suitcase carry is similar to a dumbbell farmer’s carry, but only uses one dumbbell rather than two. This simple change provides a significant challenge to the abdominal muscles. It can be a challenging finisher to any workout, or work well in fat-loss circuit training or as an accessory movement to heavy lifts like the deadlift.',
                          'Strength',
                          4,
                          7,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          391,
                          'a7df75538e18d0371726f3342f47d04c',
                          'Side plank with dumbbell external rotation',
                          'The side plank with dumbbell external rotation is a movement that combines an isometric side plank hold with a dumbbell rotation to target both the core and the rotator cuff muscles. You probably won''t be able to use much weight without disrupting your balance, but even at light weight, this is a movement that can help address multiple muscle groups in a dynamic warm-up or as accessory work at the end of a workout.',
                          'Strength',
                          4,
                          7,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          392,
                          '2586011d222cf8ed77670963d27e3ad9',
                          'Landmine Press and Catch',
                          'The single-arm linear jammer is an explosive pressing movement performed using an angled barbell anchored at floor level in a landmine device. It can also be performed by sticking a barbell in the corner of a room, preferably in a towel to protect the walls. The linear jammer involves pressing the weight into the air, then catching it with the other hand. The movement focuses primarily on the muscles of the shoulders or deltoids. It can be trained in traditional muscle and strength-focused rep ranges, for lower reps with a focus on explosive pressing power, or for higher reps.',
                          'Strength',
                          5,
                          7,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          393,
                          '8835c3a5224b4682d9364a1e5b8bc5f4',
                          'Plate halo',
                          'The plate halo is an exercise targeting the shoulder complex. It''s usually performed as part of a dynamic warm-up prior to an upper-body workout.',
                          'Strength',
                          5,
                          7,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          394,
                          '57854d9afc5c03b93e1b6e9ea98af9a4',
                          'Single-arm cable push-down',
                          'The single-arm cable push-down is a single-joint isolation movement that develops the triceps muscle one arm at a time. Because the action is purely at the elbow joint, it is difficult to use any substantial weight. Reps are usually high, such as 8-12 reps per set or more, with a focus on strict form and feeling the mind-muscle connection.',
                          'Strength',
                          6,
                          7,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          395,
                          '5de38df174db85be94b9999bf6791468',
                          'Kettlebell thruster',
                          'The kettlebell thruster is a popular kettlebell movement that combines a kettlebell front squat with a kettlebell press, while holding the bell in a goblet or bottoms-up grip. It is preceded by a clean at the start of each set, and you can perform a clean between each rep if you choose. It can be trained in traditional strength or muscle-building rep ranges, in circuit or fat-loss training, or as part of a larger kettlebell combination or complex.',
                          'Strength',
                          3,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          396,
                          '8971992345938c6d524968c69ceb1b1d',
                          'Single-arm triceps kick-back',
                          'The single-arm triceps kick-back is a popular movement to increase size and strength of the triceps. It is usually performed for moderate to high reps, at least 8-12 reps, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          4,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          397,
                          '15b0ec8417abbb63dd96af7c9bd37353',
                          'Single-leg cable hip extension',
                          'The single-leg cable hip extension is an isolation exercise that targets the glutes, specifically the gluteus maximus. It is a common burnout movement on a lower-body focused day and is usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          6,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          398,
                          '470ea3e516e07fae4c158e5ff9bcb0b6',
                          'Cable rope pull-through deadlift',
                          'The cable rope pull-through deadlift is an exercise targeting the glutes and hamstrings using a proper hip-hinging motion.',
                          'Strength',
                          6,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          399,
                          '39a2cf2d41fdc4becc1d32e2020732e2',
                          'Glute bridge',
                          'The glute bridge is a popular lower-body bodyweight exercise that primarily targets the glutes, but also activates the lower back and hamstrings. It can be performed with body weight alone, or with added resistance such as barbells, dumbbells, or bands. It can be performed for time or reps and works perfectly in a dynamic warm-up for lower-body training, but can also be performed for glute activation anytime.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          400,
                          '976d18b504faa3ace85767d54b00fa86',
                          'Single-leg glute bridge',
                          'The single-leg glute bridge is a lower-body exercise that targets the glutes, lower back, and hamstrings. It is performed one side at a time.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          401,
                          '602ec30ff41b5fd58079eaf134af6038',
                          'Step-up with knee raise',
                          'The step-up with knee raise is a lower-body exercise targeting the quads, glutes, and hamstrings. It differs from a traditional step-up in that at the top, you lift the trailing leg up to full hip flexion. This gives the exercise a greater range of motion and more of a focus on powerful hip extension in the working leg. When performed with body weight, these are usually performed for high reps as part of a dynamic warm-up, as cardio acceleration, or as part of the lower-body portion of a workout or circuit.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          402,
                          'ad9d098cd2fa3302be21d38be16b0351',
                          'Standing hip extension',
                          'The standing hip extension is a movement that activates the glutes and hamstrings. It is often performed either for time or reps as part of a dynamic warm-up.',
                          'Strength',
                          8,
                          8,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          403,
                          '9086028ab75c5a16cf444c463a7a6a28',
                          'Lunge kick',
                          'The lunge kick is a lower-body, cardio-based exercise performed at a high intensity. It includes a kick of the front leg to make the movement more powerful. It can be performed either for time or reps and is a great inclusion in a fat-loss or athleticism-focused circuit workout.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          404,
                          '256a6e2619149a317bce6ebfac9b0bb8',
                          'Curtsy lunge',
                          'The curtsy lunge is a lower-body bodyweight movement that targets the muscles of the hips and glutes. It is usually performed for moderate to high reps, at least 8-12 reps per leg.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          405,
                          'dd16e16f2e6dbdc78d5646455d4939ff',
                          'Side-lying leg lift',
                          'The side-lying leg lift is a bodyweight exercise targeting the muscles of the hips and glutes. It can be a worthy addition to a dynamic warm-up on a lower-body or strength-focused training day, a component of a lower-body circuit or workout, or a glute activation drill to do anytime. Generally, leg lifts are done for high reps, such as 8-15 reps per leg or more.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          406,
                          '336d604d04460bd014f19a638a9b590f',
                          'Groiner',
                          'The groiner is an explosive bodyweight exercise targeting the legs, shoulders, and core. It also includes a dynamic stretch of the hips. It can be performed for time or reps in any fat-loss or athleticism-focused circuit or workout.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          407,
                          '77b8c47d00884afad33db90bc21a7211',
                          'Walking lunge',
                          'The walking lunge is a lower-body exercise that targets the glutes, quads, and hamstrings while challenging stability and balance. It can be performed for reps, time, or distance in the lower-body portion of any workout.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          408,
                          'b4f5c025697db22a8bc9572a1909d1e7',
                          'Barbell hip thrust-',
                          'The barbell hip thrust is a popular exercise that targets the posterior chain, particularly the glutes and hamstrings. It involves fully extending your hips while holding a weighted barbell across the front of the hips. It is a great movement to activate the glutes prior to other lower-body training, but can also be performed in the main part of a workout, or for high reps as a glute burnout.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          409,
                          '8af32a848b141dfbc9add3f6493a8f2d',
                          'Pigeon stretch',
                          'The pigeon stretch is a lower-body stretch targeting the glutes, hips, and piriformis. It is similar to the pigeon pose from yoga, but is also popular as part of dynamic warm-ups or cool-downs in strength training. It can also be performed anytime to help combat training-related soreness.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          410,
                          '8b9fd4fe08af89e2aa282c5ae3bdb854',
                          'Levitating side kick-through',
                          'The levitating side kick-through is a full-body movement that starts in a bear crawl position and ends with a leg kicked out to the side. In between reps, you kick into the air in a partial handstand. It is commonly performed for reps or time in bodyweight circuits and animal-style flows, but can also work on its own or as part of a dynamic warm-up or mobility sequence.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          411,
                          '86a2884f4df0f2e8d47de0f6573a4788',
                          'Dumbbell single-leg hip thrust',
                          'The dumbbell single-leg hip thrust is a single-sided exercise that targets the posterior chain, particularly the glutes and hamstrings. It involves balancing on one foot and fully extending your hips while holding a dumbbell across the front of your hip. It is a great movement to activate the glutes prior to other lower-body training, but can also be performed in the main part of a workout, or for high reps as a glute burnout.',
                          'Strength',
                          8,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          412,
                          'c77b99bab2fac79196f9e7d54e984d55',
                          'Medicine ball duck walk',
                          'The medicine ball duck walk is a dynamic medicine ball movement that challenges both the upper and lower body, while also elevating the heart rate. It''s a great movement to include in medicine ball or bodyweight circuit training to increase fatigue and burn serious calories while hammering the muscles of the legs.',
                          'Strength',
                          9,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          413,
                          '24f55c48b429ad08f3f18059c9807c09',
                          'Exercise ball hip thrust',
                          'The exercise ball hip thrust is a simple yet effective way to work the glutes and hamstrings. Proper form is essential to really feel the burn in the glutes, and the ball can help guide you into the right form better than a bench, which is the usual support for hip thrusts. Unlike the bench version, the ball hip thrust is best performed with body weight or bands as resistance for safety reasons. It can be an excellent component of a warm-up for lower-body training, or a glute activation drill performed anytime.',
                          'Strength',
                          11,
                          8,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          414,
                          '969a4d679a9c309664d2c522499929ab',
                          'Barbell Deadlift',
                          'The barbell deadlift is a compound exercise used to develop overall strength and size in the posterior chain. It is a competition lift in the sport of powerlifting, but is also considered a classic benchmark of overall strength. When performed with the hands outside the knees, it is often called a "conventional" deadlift. When the feet are wide and the hands are inside the knees, it is a sumo deadlift.',
                          'Strength',
                          2,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          415,
                          '0ebc6ddf223d2da0da13fa52caceeb6a',
                          'Power clean',
                          'The power clean is a full-body movement in which the bar is pulled from the floor and caught in the front rack position in three pulls or phases. The bar is received in the "power" position, with the hips higher than a full-depth squat position. The power clean can be used as a component of the clean and press or clean and jerk, but is also a valuable lift to build explosive power and strength.',
                          'Strength',
                          2,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          416,
                          'cb81dec8d315c11b48984e969f92c5c8',
                          'Romanian Deadlift / Stiff-Legged Deadlift',
                          'The barbell stiff-legged deadlift targets the hamstrings, glutes, lower and upper back, as well as the core. It is a popular accessory movement for the deadlift, but also a muscle-building hamstring movement.',
                          'Strength',
                          2,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          417,
                          'c2d6b73d054eb94262f688026044ffd4',
                          'Kettlebell pass-through lunge',
                          'The kettlebell pass-through lunge is a dynamic leg and core exercise in which a lifter passes a weight under their front leg during lunges. It is a unique coordination challenge, but also challenging to the musculature of the abdomen, lower body, shoulders, and upper back. It is most commonly performed for higher reps, such as 10-15 reps per side, or for time. It can work in circuit-style workouts, or in lower-body or full-body time-efficient training.',
                          'Strength',
                          3,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          418,
                          '842ec53dac5e79705cb7c37b5b74d91e',
                          'Kettlebell One-Legged Deadlift',
                          'The kettlebell single-leg deadlift is a variation on the kettlebell deadlift where one foot stays planted on the ground while the other raises into the air at the bottom of the movement. It''s popular in lower-body training for strength and muscle building, but also trains balance, grip, and the core muscles.',
                          'Strength',
                          3,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          419,
                          '7cf084132dcb3bd68678600e3384446e',
                          'Single-arm kettlebell clean',
                          'The single-arm kettlebell clean is an explosive kettlebell exercise where the lifter pulls the weight to shoulder level in a single movement. While the kettlebell clean is often used as a transitional movement into the press or front squat, it is also a valuable strength and power exercise in its own right. It can be performed in low rep ranges for strength or higher rep ranges for technique practice or muscle growth.',
                          'Strength',
                          3,
                          9,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          421,
                          '0bce49915648adec5c4ea2ff3cf67007',
                          'Single-arm kettlebell swing',
                          'The single-arm kettlebell swing is a popular exercise emphasizing the muscles of the hamstrings, glutes, and back. Because you are only swinging with one arm at a time, it is also uniquely challenging to the grip and core muscles. It is often used to train explosive power, for aerobic or cardiovascular conditioning, or in circuit training.',
                          'Strength',
                          3,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          422,
                          '323497c8c5497e28dbed624bb1591ed9',
                          'Romanian Deadlift With Dumbbells',
                          'The dumbbell stiff-legged deadlift targets the hamstrings, glutes, low and upper back, as well as the core. The purpose of the stiff-legged, as opposed to Romanian deadlift with slightly bent knees, is to engage the hamstrings and low back to an even greater degree.',
                          'Strength',
                          4,
                          9,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          424,
                          '0e9167569a953a4b77f23547fa9bf555',
                          'Hamstring slide',
                          'The hamstring slide is a bodyweight exercise targeting the hamstrings. Lying supine on a smooth surface, bend your knees to pull both heels toward you. The sliding action requires a pad, cloth, or furniture sliders under the heels. These are considered more difficult than exercise ball hamstring curls and are a great primer movement before heavy squats or deadlifts, or as an accessory movement later in a lower-body workout.',
                          'Strength',
                          5,
                          9,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          425,
                          '7a79294a48d9fb17e5774c463c3bca5a',
                          'Lying cable leg curl',
                          'The lying cable leg curl is a classic machine exercise for building greater muscle size and strength in the hamstrings. It''s easy to learn, easy to master, and poses little in the way of injury risk. It is usually performed for moderate to high reps, at least 8-12 reps per set, as part of lower-body training.',
                          'Strength',
                          6,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          426,
                          'f129852d6d44764a0f1e18d8ceff45a9',
                          'Standing cable leg curl',
                          'The standing cable leg curl is an isolation exercise for the hamstrings. It is often used as a variation of leg curl machines and for working each side independently. It is usually performed for moderate to high reps, at least 8-12 reps per set, as part of lower-body training.',
                          'Strength',
                          6,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          427,
                          'cb303a05179570bec7fa1be722689207',
                          'Lying Leg Curls',
                          'The lying leg curl is a popular machine-based exercise for the legs, particularly the hamstrings. It is similar to the seated leg curl, but the open hip angle in the lying leg curl may incorporate more glute and calf activation. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of a leg pre-exhaust or as a muscle-building movement for lower-body training.',
                          'Strength',
                          7,
                          9,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          428,
                          '113d6a645828315295b5c60bcc3e3cde',
                          'Seated Leg Curl',
                          'The leg curl is a popular machine-based exercise for the legs, particularly the hamstrings. It comes in seated and lying varieties, but the seated leg curl machine is more common in commercial gyms. Leg curl variations are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of a leg pre-exhaust or as a muscle-building movement for lower-body training.',
                          'Strength',
                          7,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          429,
                          'db51c9d8e4e204d01073fd76a936bf2f',
                          'Smith machine stiff-legged deadlift',
                          'The Smith machine stiff-legged deadlift is a machine-based exercise targeting the muscles of the hamstrings, glutes, and upper back. The Smith machine mimics a barbell but provides more stability. This movement can be programmed like a traditional stiff-legged or Romanian deadlift, in low reps for strength or higher reps for muscle and strength endurance. It is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of a full-body or lower-body workout.',
                          'Strength',
                          7,
                          9,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          430,
                          'cd86916de0762103a38bbfe34c4fbdca',
                          'Single-leg lying leg curl',
                          'The single-leg lying leg curl is a popular machine-based exercise for the legs, particularly the hamstrings. It is similar to the seated leg curl, but the open hip angle in the lying leg curl may incorporate more glute and calf activation. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of a leg pre-exhaust or as a muscle-building movement for lower-body training. Performing it one leg a time allows you to focus on the mind-muscle connection of each leg and address muscle imbalances.',
                          'Strength',
                          7,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          432,
                          'ad9588216c6837079b630364cafa5117',
                          'Single-leg leg extension-',
                          'The single-leg leg extension is a popular machine-based exercise for the legs, particularly the quadriceps. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of a leg pre-exhaust or as a muscle-building movement for lower-body training. Performing it one leg a time allows you to focus on the mind-muscle connection of each leg and address muscle imbalances.',
                          'Strength',
                          7,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          433,
                          '2e4d4b9b3b05e5edf954c1c8608f191f',
                          'Natural Glute Ham Raise',
                          'The glute ham raise is an exercise targeting the glutes and hamstrings on a GHD.',
                          'Strength',
                          8,
                          9,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          434,
                          'c61fed5ba50f5fb292098cfff172b2cc',
                          'Glute ham raise',
                          'The glute ham raise is an exercise targeting the glutes and hamstrings on a GHD, or glute ham developer bench. The unassisted version of the movement requires serious hamstring strength, so it is more common to see versions that use a band or PVC pipe for assistance. It is commonly performed as an accessory movement for heavy barbell lifts. While a single rep may be a struggle at first, with time, strong athletes can build up to doing them for 8-12 reps per set.',
                          'Strength',
                          10,
                          9,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          435,
                          '37022d6bde9201ae2cac5e5a8321ffdb',
                          'Exercise ball leg curl',
                          'The exercise ball leg curl is an exercise targeting the hamstrings. In particular, it targets the knee flexion function of the hamstrings, as opposed to deadlift variations, which target the other hamstring function, hip flexion. Many lifters opt for this exercise when they don''t have access to a lying leg curl machine, but it is worth considering even if you already do machine curls.',
                          'Strength',
                          11,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          436,
                          '774fa6e675da1b7bb64d63c530c9e10f',
                          'Ball Hamstring Hat Trick',
                          'The exercise ball leg curl is an exercise targeting the hamstrings. In particular, it targets the knee flexion function of the hamstrings, as opposed to deadlift variations, which target the other hamstring function, hip flexion. Many lifters opt for this exercise when they don’t have access to a lying leg curl machine, but it is worth considering even if you already do machine curls.',
                          'Strength',
                          11,
                          9,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          437,
                          '3d3768317dab61b4743570c1be4d5dbf',
                          'Band-assisted pull-up',
                          'The band-assisted pull-up is a variation of the pull-up exercise in which the reps are performed with an elastic band looped around the feet or knees. This reduces weight and resistance at the bottom of the rep, while increasing it toward the top. Like other pull-up variations, it builds strength and muscle in the upper back, biceps, and core, and is often used as a way to help people boost their pull-up numbers or perform their first rep.',
                          'Strength',
                          1,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          438,
                          '340eb58e99d0efa5ab0e7dbaebd48982',
                          'Assisted Chin-Up',
                          'The reverse-grip chin-up is a variation of the pull-up exercise in which the reps are performed with the palms facing toward the body, in an underhand position, with a band looped around the feet or knees. This reduces weight and resistance at the bottom of the rep, while increasing it toward the top. Like other pull-up variations, it builds strength and muscle in the upper back, biceps, and core, but it utilizes the biceps slightly more than overhand band-assisted pull-ups.',
                          'Strength',
                          1,
                          10,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          439,
                          '8e4483eedf4da47bdb35df3fbe1ebc9c',
                          'Single-arm band low row',
                          'The single-arm band low row is a single-arm row variation utilizing a band for resistance that is anchored low. It targets the muscles of the middle back, like the lats (latissimus dorsi) and rhomboids, but also the core. It is usually performed for moderate to high reps, at least 8-15 reps per set, in the later stages of a back or upper-body workout.',
                          'Strength',
                          1,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          440,
                          '67c30e83f6c71700196b2a1ffbba7593',
                          'Bent-arm barbell pull-over',
                          'The bent-arm barbell pull-over was a staple exercise of the "Golden Era" of bodybuilding and a favorite of Arnold Schwarzenegger himself. Done properly, the exercise targets the pecs, lats, and serratus anterior muscles. Old-school bodybuilders would perform them with light weights for sets of 20 between sets of heavy 20-rep squats, but pull-overs are more popular today in moderate rep ranges, such as 8-12 reps per set, as part of an upper-body workout.',
                          'Strength',
                          2,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          441,
                          '91881144e6ccb2ad5da5487b14f53ed6',
                          'Single-arm barbell bent-over row',
                          'The single-arm barbell bent-over row is a barbell exercise focused on the muscles of the middle back, such as the lats (latissimus dorsi) and rhomboids. It also targets the biceps and grip. If the loose end of the barbell moves around, it can be secured by placing it in the corner of a room.',
                          'Strength',
                          2,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          442,
                          '6c8a69bfbf901cece215d09230237be5',
                          'Dumbbell seal row',
                          'The dumbbell seal row is a weighted exercise targeting the muscles of the middle back, including the lats (latissimus dorsi) and rhomboids. It can be performed on a special elevated bench, on a bench placed on top of boxes or benches, or on a bench with a slight incline. The higher the bench, the greater the range of motion and stretch at the bottom of the movement. It is usually performed as an assistance movement for back strength and muscle growth, in rep ranges of 8-12 reps per set or higher.',
                          'Strength',
                          4,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          443,
                          '5c692059ca7a938c997e49a0bb4baeca',
                          'Bent-over dumbbell rear delt fly',
                          'The bent-over dumbbell rear delt fly is a popular upper-body exercise that targets the muscles on the back of the shoulder joint, specifically the rear head of the deltoid. Since pressing movements build the front and (to a lesser degree) side deltoid heads, this move is often done to promote balanced shoulder development. It is usually performed for high reps, such as 10-15 reps per set or more, as part of a shoulder or upper-body workout.',
                          'Strength',
                          4,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          444,
                          '00e5a7a72e8c3a980827bbe84ffa5a0d',
                          'Dumbbell renegade row',
                          'The dumbbell renegade row combines rowing and core training into a single difficult movement. It''s popular in time-efficient strength and muscle-building workouts, as well as in circuit-style training.',
                          'Strength',
                          4,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          445,
                          '0076f76934ddc9427277f02adbe3d978',
                          'Weighted pull-up',
                          'The weighted pull-up is a more advanced variation of the pull-up exercise in which the lifter adds extra weight to their body. Options for adding weight include a dip belt, weighted vest, chains, a dumbbell placed between the feet or legs, or looping a kettlebell over the foot. Like other pull-up variations, the weighted pull-up builds strength and muscle in the upper back, biceps, and core.',
                          'Strength',
                          5,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          446,
                          'e74aa79afa140212630c82f20eca5c8a',
                          'Floor rope climb',
                          'The floor rope climb is an exercise that involves performing partial rope climbs in a prone position with the feet on the floor. It can help prepare someone for full rope climbs, but also trains the muscles of the back, biceps, and grip. It can be done for time or reps.',
                          'Strength',
                          5,
                          10,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          447,
                          '07bdb0f675ad48f77dd9505da214951a',
                          'Around-the-world pull-up',
                          'The around-the-world pull-up is a more advanced version of the classic pull-up. It focuses stress more directly on the individual arms or sides of the back, while also boosting the time under tension at the top of each rep. It can be used as a progression toward a one-arm pull-up, or simply as a way to increase the challenge and variety of your pull-up training.',
                          'Strength',
                          5,
                          10,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          448,
                          '89ab99d5837755958a005e58eab51dc7',
                          'L-sit chin-up',
                          'The L-sit chin-up is an exercise targeting the back, biceps, core, and overall upper-body strength. It is considered significantly more difficult than standard chin-ups, and as such, is often performed for relatively low reps, such as 5-8 reps per set or less, with a focus on strength and form.',
                          'Strength',
                          5,
                          10,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          449,
                          'ac476921e9267b17a98fe0f4fa6b0f8e',
                          'Incline straight-arm pull-over',
                          'The incline straight-arm pull-over is an upper-body exercise targeting the chest and lats (latissimus dorsi). Performing it on an incline bench emphasizes the stretch on the chest in particular. If this movement causes pain in the front of the shoulders, perform it with a more limited range of motion or try pull-overs using a high cable stack instead. Pull-over variations are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of chest or back-focused upper-body training.',
                          'Strength',
                          5,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          450,
                          'fbee31f6dc1852b5e3fb69041c79f910',
                          'Machine high row',
                          'The machine high row is a machine-based exercise targeting the back muscles, including the lats, rhomboids, and middle and lower traps. It approximates the motion of a free-weight row, but uses a selectorized weight-stack or plate-loaded machine. Many such machines also allow you to choose between different grips and grip widths. Machine rows are often done for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or back-focused portion of a workout.',
                          'Strength',
                          5,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          451,
                          '4f471669ade29e40c3ff3da502d91ebc',
                          'Standing dumbbell knee crunch',
                          'The standing dumbbell knee crunch is a great way to train the abs while standing up. Additionally, the deltoids are worked because the lifter holds a pair of dumbbells overhead throughout.',
                          'Strength',
                          5,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          452,
                          '723ac0134d74c911cfec6abe4e67f24f',
                          'Close-grip pull-down',
                          'The close-grip pull-down is a variation on the lat pull-down that is performed with an overhand grip and the hands slightly closer than shoulder-width apart. This increases the range of motion beyond wider grips, and may increase the time under tension in each rep. This variation is usually performed for moderate to high reps as part of a back or upper-body workout.',
                          'Strength',
                          6,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          453,
                          '2fc595e541d15dbc76347fd18194f2e1',
                          'Shotgun row',
                          'The shotgun row is a single-arm row variation utilizing a cable stack in a staggered stance. It targets the muscles of the middle back, like the lats (latissimus dorsi) and rhomboids, but also the core. It is usually performed for moderate to high-reps, at least 8-15 reps per set, in the later stages of a back or upper-body workout.',
                          'Strength',
                          6,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          454,
                          '3c90e10f6f1df07ce1ab20ec44d0a328',
                          'Close-Grip Front Lat Pulldown',
                          'The close-grip pull-down is a variation on the lat pull-down, acable-based exercise machine that’s ubiquitous in gyms around the world. This back builder is easy to learn and highly effective, allowing for variable resistance depending on where you place the pin in the stack.',
                          'Strength',
                          6,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          455,
                          '20d1294514de4e591598a0ae4521d875',
                          'Straight-arm rope pull-down',
                          'The straight-arm rope pull-down is a variation of the straight-arm lat pull-down performed using a cable stack machine and a rope grip. It can either be performed in an athletic upright stance, or slightly bent over. It both stretches and contracts the muscles of the lats (latissimus dorsi) as well as providing additional activation to the other upper back muscles and the core. Because the triceps are also isometrically involved in the movement, it is usually performed for higher reps, such as 8-15 reps or more.',
                          'Strength',
                          6,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          456,
                          '619007b8e4c24f799ad60b3189f72e5c',
                          'Lat pull-down',
                          'The lat pull-down is a cable-based exercise that''s ubiquitous in gyms around the world. This back builder is easy to learn and highly effective at building back size and strength. It''s usually trained in moderate to high reps, such as 8-12 reps per set. If grip strength is a limitation, you can wear wrist straps.',
                          'Strength',
                          6,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          457,
                          '21779d24ebd9fb7135899ad3ab72d3ea',
                          'Straight-Arm Pulldown',
                          'The straight-arm bar pull-down is a variation of the straight-arm lat pull-down performed using a cable stack machine. It can either be performed in an athletic upright stance, or slightly bent-over. It both stretches and contracts the muscles of the lats (latissimus dorsi) as well as providing additional activation to the other upper back muscles and the core. Because the triceps are also isometrically involved in the movement, it is usually performed for higher reps, like 8-15 reps or above.',
                          'Strength',
                          6,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          458,
                          '2c0328f64f8ced745007bab93cfae260',
                          'Single-arm kneeling lat pull-down',
                          'The single-arm kneeling lat pull-down is a variation of the lat pull-down exercise performed one arm at a time, with the knees on the ground, rather than sitting on a bench or machine. It has all of the same benefits of a lat pull-down performed on a bench or machine, in addition to providing further activation to the core and lower body.',
                          'Strength',
                          6,
                          10,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          459,
                          '2fdab09ff4fe08550356490f9df66e8a',
                          'Elevated Cable Rows',
                          'The cable seated row is a popular exercise to train the muscles of the upper back, including the lats (latissimus dorsi), traps, rhomboids, and rear deltoids, using a cable stack. It also targets the biceps to a lesser degree. The cable row can work well in a variety of rep-ranges, but is most popular in muscle-building workouts or as an accessory movement for strength workouts.',
                          'Strength',
                          6,
                          10,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          460,
                          '076d37590a21e71d97ae45cc7956c350',
                          'Kneeling lat pull-down',
                          'The kneeling lat pull-down is a variation of the lat pull-down exercise performed with the knees on the ground rather than sitting on a bench or machine. It has all of the same benefits of a lat pull-down performed on a bench or machine, in addition to providing further activation to the core and lower body.',
                          'Strength',
                          6,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          461,
                          '12107f36bdc2ac8a4c7fc56e7cd0e423',
                          'Behind-the-neck pull-down',
                          'The behind-the-neck pull-down is a cable exercise intended to target the muscles of the upper and middle back. If you have the requisite shoulder mobility, it can help you target the upper back muscles, including the trapezius and rhomboids, as well as the lats (latissimus dorsi). It is popular among elite bodybuilders and physique athletes, but some coaches consider it unsafe to the shoulder joint, particularly for people with existing shoulder problems.',
                          'Strength',
                          6,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          462,
                          '1caae9747fbd10f706919f2786282e07',
                          'Straight-arm cable pull-over',
                          'The straight-arm cable pull-over is an exercise that focuses on the muscles of the lats (latissimus dorsi) and chest using a cable stack and a flat bench. It is most commonly used for higher reps, such as 10-15 or more, in muscle-building workouts. It is also an effective substitute for dumbbell pull-overs or a pull-over machine, if you don''t have access to them or they aggravate your shoulders.',
                          'Strength',
                          6,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          463,
                          'f0d1c4cc1ca3c1020249189bb1b6e252',
                          'High-cable standing row',
                          'The high-cable standing row is an exercise targeting the lats. The high position allows for more engagement of the upper back, as well, specifically the rhomboids and teres major.',
                          'Strength',
                          6,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          464,
                          '03c71b7769af6aebacf9097591118f37',
                          'Reverse-grip lat pull-down',
                          'The reverse-grip lat pull-down is variation on the lat pull-down that targets the lower lats more than an overhand grip. Because the hands are relatively close together, it also increases the range of motion beyond wider-grip pull-down variations. It can be performed for low reps, such as 5-6 per set, for back strength, or for higher reps for size.',
                          'Strength',
                          7,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          465,
                          '0df9d716eb15cefb9355b542b316b40b',
                          'Machine seated row',
                          'The machine seated row is a popular exercise targeting the back muscles, particularly the lats (latissimus dorsi), rhomboids, and middle and lower trapezius. There is a wide variety of seated row machines, but most of them approximate the motion of a free-weight row, but in an upright, forward-facing position. Machine row variations are often performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or back-focused portion of a workout.',
                          'Strength',
                          7,
                          10,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          466,
                          '381b2aab57ae83cae5ae9fa517349c61',
                          'Machine-assisted pull-up',
                          'The machine-assisted pull-up takes a classic back-building exercise and adds assistance to make the movement easier than the bodyweight version. The amount of assistance can easily be changed by moving the pin in the stack. While some people use this variation as a substitute for pull-ups or as an assistance exercise for pull-ups, it is also effective as a way to perform the pull-up motion in traditional muscle-building ranges. This variation is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or back-focused training.',
                          'Strength',
                          7,
                          10,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          467,
                          'f00ba46ad1634c18c885135f847ef9c2',
                          'Single-arm pull-down',
                          'The single-arm pull-down is a variation on the lat pull-down that is performed one arm at a time, usually with a D-shaped handle and a cable stack. Many lifters find they can feel the lat (latissimus dorsi) muscles working better with single-arm variations.',
                          'Strength',
                          7,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          468,
                          '6cd4a9e256210141b32948e797fbb0a8',
                          'Single-arm machine high row',
                          'The single-arm machine high row is a machine-based exercise targeting the back muscles, including the lats, rhomboids, and middle and lower traps. It approximates the motion of a free-weight row, but uses a selectorized weight-stack or plate-loaded machine. Many such machines also allow you to choose between different grips and grip widths. Machine-based rows are often done for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or back-focused portion of a workout.',
                          'Strength',
                          7,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          469,
                          'c8fcedf05b008937ad5c0adc8f9f0531',
                          'Pull-ups',
                          'The pull-up is a multijoint bodyweight exercise that builds strength and muscle in the upper back, biceps, and core. It is often used as a measurement tool in military or tactical fitness tests, and is an excellent gauge of "relative strength" which is strength in relation to body weight.',
                          'Strength',
                          8,
                          10,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          470,
                          'ab25470d8197481704246ed2283234f4',
                          'Rope climb',
                          'The rope climb is an exercise that is used commonly in CrossFit workouts and as a test of upper-body strength. It was even contested at the Olympics in the early 20th century. It targets a wide range of upper-body musculature, including the hands and forearms, shoulders, biceps, lats (latissimus dorsi), and core.',
                          'Strength',
                          8,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          471,
                          '1bc861fef6e4fc590e5de5d3e189e629',
                          'Neutral-grip pull-up',
                          'The neutral-grip pull-up is a multijoint bodyweight exercise in which the reps are performed with the palms facing one another. Like other pull-up variations, it builds strength and muscle in the upper back, biceps, and core. It can be used as a more shoulder-friendly alternative to straight-bar pull-ups, or to help perform more reps than you can perform overhand.',
                          'Strength',
                          8,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          472,
                          'e9bf25f570fd04a4e624e38243d473f3',
                          'Negative pull-up',
                          'The negative pull-up is a multijoint bodyweight exercise that focuses on just one half of the traditional pull-up: the lowering, eccentric, or "negative" portion. Because muscles are stronger eccentrically than they are concentrically, many people can perform negatives even if they can''t perform full pull-ups. For this reason, it is a popular training tool to help people earn their first pull-up rep, or as a back-off exercise after doing full pull-ups.',
                          'Strength',
                          8,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          473,
                          '4a53936bcd78d25553c781138afc1827',
                          'Chin-Up',
                          'The a chin-up is a variation of the pull-up exercise in which the reps are performed with the palms facing toward the body, in an underhand position, with a grip that is narrower than shoulder-width. Like other pull-up variations, it builds strength and muscle in the upper back, biceps, and core, but it utilizes the biceps slightly more than overhand pull-ups. It can be used as a more shoulder-friendly alternative to straight-bar pull-ups, or to help perform more reps than you can perform overhand.',
                          'Strength',
                          8,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          474,
                          'dc32b2b7c7a209322601e9d3b1cad1d4',
                          'Bent-over scapular slide',
                          'The bent-over scapular slide is an upper-body exercise that helps with scapular and shoulder mobility. It is commonly performed for time or reps as part of a dynamic warm-up for the upper body.',
                          'Strength',
                          8,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          475,
                          '00d6a3ecef269cbd19a634ead62183da',
                          'Iron cross stretch',
                          'The iron cross stretch is a bodyweight stretch that focuses on hip and thoracic spine mobility.',
                          'Strength',
                          8,
                          10,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          476,
                          '30ec2634cf4d9d03dd5e64e480b41d60',
                          'Band good morning-',
                          'The band good morning is an exercise targeting the hamstrings and glutes. It is often performed in powerlifting-style training for high reps, or in the place of barbell good mornings.',
                          'Strength',
                          1,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          477,
                          'cfd1963951a3f136bbc0ed1b81eeeeb1',
                          'Band deadlift',
                          'The band deadlift is a lower-body exercise that mainly targets the hamstrings while also benefiting the glutes and lats using a proper hip-hinging motion.',
                          'Strength',
                          1,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          478,
                          'a62fc6130a9b5fc773948256909a4045',
                          'Barbell good morning',
                          'The barbell good morning is an exercise that targets glute, hamstring, and lower back development. It is often trained as an accessory movement to the deadlift, but also has value on its own. It is sometimes performed for reps in traditional strength-focused rep ranges such as 5-8 reps per set, but due to the risk posed to the lower back, is rarely treated as a max-effort single-rep lift.',
                          'Strength',
                          2,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          479,
                          '5406205ba6bfe94f4fe979e845e7a3b2',
                          'Kettlebell deadlift',
                          'The kettlebell deadlift is a foundational movement in kettlebell training. It''s often taught as a buildup or regression to the kettlebell swing, as well as to instruct the "hip hinge" motion in a more approachable manner than with a barbell.',
                          'Strength',
                          3,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          480,
                          '6398d2180b6cecdf1aec1350516bb929',
                          'Dumbbell skier',
                          'As the name suggests, the dumbbell skier takes the motion of skiing and replaces the poles with dumbbells. The hip and torso motion are similar to a kettlebell swing, as are the muscles it targets, including the hamstrings, glutes, upper back, and grip. However, unlike the traditional kettlebell swing, the arms are outside of the knees. This movement can be performed for time or for reps, but is usually performed for relatively high reps, such as 8-12 sets per rep or more, as part of a fat-loss or athleticism-focused circuit or workout.',
                          'Strength',
                          4,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          481,
                          '6a7ea250d6b022a20a3a532de492ebe5',
                          'Dumbbell kickstand deadlift',
                          'The dumbbell kickstand deadlift is a movement targeting the muscles of the hamstrings, glutes, and back. The kickstand position can help focus the stretch and contraction on each individual leg, similar to a single-leg Romanian deadlift, while presenting less of a balance challenge. It can be performed in low reps, such as 5-8 reps per set, for strengthening the posterior chain, or for higher reps for muscle growth.',
                          'Strength',
                          4,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          482,
                          'd64fbf03dc58ba67359c0269fb22a704',
                          'Neutral-grip lat pull-down',
                          'The neutral-grip lat pull-down is a variation on the lat pull-down that uses a handle with a neutral (palms facing in) grip. This arrangement helps to build lat width and target the upper lats. This movement is usually performed for moderate to high reps, such as 8-12 per set or higher, as part of an upper-body or back-focused workout.',
                          'Strength',
                          6,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          483,
                          '3d481f9bce2f32bcee997a46eab1d367',
                          'Seated cable deadlift',
                          'The seated cable deadlift is a version of the deadlift or hip hinge movement that is performed on a seated cable row machine. Similar to a stiff-legged deadlift or 45-degree back extension, it targets the muscles of the lower back, as well as the glutes and upper back to a lesser degree. It is usually utilized in higher rep ranges, at least 8-12 reps per set, on a back-focused muscle-building day, or as a deadlift accessory lift to strengthen the lower back.',
                          'Strength',
                          6,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          484,
                          'c5d021c4b9187d09974a49e37ebaaf26',
                          'Cable stiff-legged deadlift',
                          'The cable stiff-legged deadlift is a lower-body exercise that mainly targets the hamstrings, while also benefiting the glutes using a proper hip-hinging motion.',
                          'Strength',
                          6,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          485,
                          '7899abcbdd16411e40105a704deb516d',
                          'Single-leg cable stiff-legged deadlift',
                          'The single-leg cable stiff-legged deadlift is a lower-body exercise that mainly targets the hamstrings, while also benefiting the glutes using a proper hip-hinging motion. Training one leg at a time allows for working out imbalances.',
                          'Strength',
                          6,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          486,
                          '7407c310398dab80ba8035ecce0ac7e3',
                          'Back extension',
                          'The back extension is an exercise used to build lower back strength that also targets the hamstrings and glutes. It is often performed on a 45-degree bench with the feet anchored. Unweighted back extensions are often performed for high reps, such as 15-20 reps or more, but the movement can also be performed with added weight in lower rep ranges, such as 8-12 reps per set.',
                          'Strength',
                          8,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          488,
                          '15672d30e81d345fe91542fdadc17164',
                          'Superman',
                          'The Superman is a bodyweight exercise that consists of isometric holds in an extended spine position. It targets the muscles of the posterior chain, including the muscles of the glutes, spinal erectors, and upper back. It can be performed as part of a dynamic warm-up, or for muscle activation or mobility anytime.',
                          'Strength',
                          8,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          489,
                          'cdabdf565085b26cfd48fb11f1af4dd6',
                          'Weighted back extension',
                          'The weighted back extension is an exercise targeting the spinal erectors, as well as the glutes and hamstrings. Back extensions are often done for high reps without weight, but when done with weight, they can be an excellent accessory movement for deadlift strength as well as an overall posterior-chain strength builder. Because your back is the limiting factor, it''s still an exercise that is usually done for moderate to high reps, such as 8-12 reps per set or higher. You can weight it with a plate or by holding a dumbbell or other weight in your hands.',
                          'Strength',
                          8,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          490,
                          'fb371e31ccdd85a1cb31713596c7df62',
                          'Exercise ball weighted hyperextension',
                          'The exercise ball weighted hyperextension is an exercise that strengthens the lower back. If balance is an issue, have someone hold your feet.',
                          'Strength',
                          11,
                          11,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          491,
                          '85e729564f1eeb4a42e29cf12db22d8d',
                          'Exercise ball rear delt fly',
                          'The exercise ball rear delt fly is a dumbbell exercise targeting the rear heads of the shoulders, as well as the muscles of the upper-middle back. Lying prone on an exercise ball offers support to perform the movement. It is generally performed for moderate to high reps as a part of upper body or shoulder training.',
                          'Strength',
                          11,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          492,
                          '7b5d19d57ff0d3bf833c26d2a075f91a',
                          'Lying rear delt Y',
                          'The lying rear delt Y works the shoulders, specifically the rear heads, as well as the lower trapezius muscles. At the top of the motion, the arms and torso form a Y—hence the name. Shoulder Y variations are usually performed with light weights as a warm-up or prehab movement for upper-body training, or as a burnout on shoulder day.',
                          'Strength',
                          11,
                          11,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          493,
                          'bbce965ff6626d36ec162cf66618926d',
                          'Band-assisted chin-up',
                          'The band-assisted chin-up is a variation of the pull-up exercise in which the reps are performed with the palms facing toward the body in an underhand position, with a band looped around the feet or knees. This reduces weight and resistance at the bottom of the rep, while increasing it toward the top. Like other pull-up variations, it builds strength and muscle in the upper back, biceps, and core, but it utilizes the biceps slightly more than overhand band-assisted pull-ups.',
                          'Strength',
                          1,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          494,
                          'b7c0b84e883befee9889a2a4db4665b0',
                          'Band bent-over row',
                          'The band bent-over row is an exercise to develop and strengthen the muscles of the upper and middle back, like the latissimus (lat), lower trapezius, and rear deltoids. Bands provide dynamic resistance and can work equally well in strength, muscle-building, or circuit-style fat-loss workouts.',
                          'Strength',
                          1,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          495,
                          '82524648aace1c16da97cdd5c1a512e2',
                          'Heavy band bent-over row',
                          'The heavy band bent-over row is a variation of the popular barbell exercise to develop and strengthen the muscles of the upper and middle back, like the latissimus (lats), lower trapezius, and rear deltoids. It can work equally well in strength, muscle-building, or circuit-style fat-loss workouts.',
                          'Strength',
                          1,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          496,
                          '96e6b356430d1141939e092ff773b34a',
                          'Reverse-grip bent-over row',
                          'The reverse-grip bent-over row is a compound exercise used to build strength and size in both the lower and upper back. It targets nearly all of the muscles in the back, but particularly the lats, rhomboids, and lower back. It is thought to target the biceps and lats a bit more directly than overhand barbell rows. Because it can be loaded heavily, it is a popular movement in strength and muscle-focused upper-body workouts.',
                          'Strength',
                          2,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          497,
                          '07cfe1531f432b78c6345b49bbf25a4e',
                          'One-Arm Long Bar Row',
                          'The single-arm landmine bent-over row is a barbell exercise focused on the muscles of the middle back, such as the lats (latissimus dorsi) and rhomboids. It also targets the biceps and grip. It utilizes a landmine device which anchors one end of the barbell near the ground, but could also be approximated by placing the barbell in the corner of a room.',
                          'Strength',
                          2,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          498,
                          '40ab3d1e4a78b4eb4068c9a97928639f',
                          'Bent Over Barbell Row',
                          'The barbell bent-over row is a compound exercise used to build strength and size in both the lower and upper back. It targets nearly all of the muscles in the back, but particularly the lats, rhomboids, and lower back. It is commonly utilized as an accessory movement for the deadlift in powerlifting, but is also popular in strength and muscle-focused upper-body workouts.',
                          'Strength',
                          2,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          499,
                          'c0475378661bc19de4c9c9f38cf5276f',
                          'Pendlay Row',
                          'The Pendlay row, named after the well-known strength coach Glenn Pendlay, is a bent-over row variation where each rep starts with the barbell resting on the ground. This eliminates the stretch reflex and forces the lifter to pull with power and a bent-over spine. The Pendlay row can be performed heavy for low reps, but is usually performed for moderate reps, such as 5-8 per set.',
                          'Strength',
                          2,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          500,
                          '43bbfff605729434677ed9bbc4f2fd30',
                          'Barbell seal row',
                          'The barbell seal row is a weighted exercise targeting the muscles of the middle back, including the lats (latissimus dorsi) and rhomboids. It can be performed on a special elevated bench, on a bench placed on top of boxes or benches, or on a bench with a slight incline. The higher the bench, the greater the range of motion and stretch at the bottom of the movement. It is usually performed as an assistance movement for back strength and muscle growth, in rep ranges of 8-12 reps per set or higher.',
                          'Strength',
                          2,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          502,
                          'ad17893e149c58bd84df67548d9bbf29',
                          'Barbell deadlift bent-over row complex',
                          'The barbell deadlift bent-over row complex combines two movements to target the posterior chain. It requires using a lighter weight than you could handle for heavy deadlifts alone, but doubles down on activation in the upper back, lower back, and glutes.',
                          'Strength',
                          2,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          503,
                          '05a1f50b1522d33a8b0a49a2d82105da',
                          'Kettlebell alternating renegade row',
                          'The kettlebell alternating renegade row combines rowing and core training into a single difficult movement. It''s popular in time-efficient strength and muscle-building workouts, as well as in circuit-style training.',
                          'Strength',
                          3,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          505,
                          'f62f7ba12b383499c2861517abda7535',
                          'One-Arm Dumbbell Row',
                          'The single-arm bench dumbbell row is a popular exercise for building the latissimus dorsi, or lat, muscles of the back. The bench is used for support during the rowing motion.',
                          'Strength',
                          4,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          506,
                          '399a85a2a7ebed5351e10324db777fa3',
                          'Incline dumbbell row',
                          'The incline dumbbell row is an upper-body exercise targeting the lats (latissimus dorsi) and upper-back muscles, as well as the biceps. Performing it on an incline bench helps target the lower lats in particular. Dumbbell row variations are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or back-focused portion of a workout.',
                          'Strength',
                          4,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          507,
                          '378987a6eba3190f6d7a1c72fd0065f8',
                          'Man-maker',
                          'The man-maker is a sequence of exercises combining a dumbbell front squat, military press, renegade row, and sprawl. Between these movements it challenges muscles across the body, along with the cardiovascular system. It can be performed for rounds or for time as a single full-body exercise or as part of a fat-loss or athleticism-focused workout.',
                          'Strength',
                          4,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          508,
                          '40e3414e0094fc145e336a63a2a6d298',
                          'Dumbbell bent-over row',
                          'The dumbbell bent-over row is a popular exercise to develop and strengthen the muscles of the upper and middle back, like the latissimus (lat), lower trapezius, and rear deltoids. It can work equally well in strength, muscle-building, or circuit-style fat-loss workouts.',
                          'Strength',
                          4,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          509,
                          '09d5aefe2c782231271b75c9a2b2444a',
                          'Decline dumbbell chest fly',
                          'The decline dumbbell chest fly is an upper-body exercise targeting the muscles of the chest, particularly the lower chest. It will require less weight than a decline press, which makes it a great hypertrophy exercise with high reps. Fly variations are usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          4,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          510,
                          'cb80985d5bb29ff406772fe2da26822e',
                          'Dumbbell stiff-legged deadlift',
                          'The dumbbell stiff-legged deadlift is a dumbbell exercise that targets the hamstrings, glutes, lower and upper back, and core. The difference between a stiff-legged deadlift and a Romanian deadlift is primarily the amount of knee bend. The knees are only slightly bent in a stiff-legged deadlift, while they bend more in a Romanian deadlift. Stiff-legged deadlifts are generally performed for low to moderate reps, such as 8-10 reps per set, with a focus on maximizing the hamstring stretch rather than moving heavy weight. Feel free to wear a weight belt to protect your lower back.',
                          'Strength',
                          4,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          512,
                          '7e7b692945f202f4d7335ab5e507d8b2',
                          'Alternating sit-through with crunch',
                          'The alternating sit-through with crunch is a full-body movement that starts in a bear crawl position and ends with a leg kicked out to the side. In between reps, you perform a crunch. It is commonly performed for reps or time in bodyweight circuits and animal-style flows, but can also work on its own or as part of a dynamic warm-up or mobility sequence.',
                          'Strength',
                          5,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          513,
                          '186d43a5e308241809df14b06139c90f',
                          'Upside-down pull-up',
                          'The upside-down pull-up is an advanced bodyweight exercise that is normally performed on a pair of gymnastic rings. It involves pulling the body toward the ceiling in an inverted position. It targets the same muscles as traditional pull-ups, including the lats (latissimus dorsi), biceps, and core. However, the pulling angle is more akin to a bent-over row or upright row, depending on the angle of your hips.',
                          'Strength',
                          5,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          514,
                          'fbc69e0a8b580a8707b7245ca1d521a7',
                          'Smith machine inverted row',
                          'The Smith machine inverted row is a bodyweight exercise targeting the muscles of the lats (latissimus dorsi) and upper back, using the bar of the Smith machine to hang and pull from. You can change the bar height to customize the difficulty level and desired angle of the row. This variation is usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          5,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          515,
                          '7d50c8985b65dc8e159a0e1e6e2f16f6',
                          'Suspended row',
                          'The suspended row is a bodyweight pulling exercise that focuses on the muscles of the middle and upper back, as well as the biceps. It can be trained in traditional muscle-building rep ranges or for higher reps. It can also work as part of a dynamic warm-up for a pressing or pulling-focused workout.',
                          'Strength',
                          5,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          516,
                          '237b187e234c8db7032b9dfb9bb655aa',
                          'Single-arm cable seated row',
                          'The single-arm cable seated row is a version of the cable row movement that trains the muscles of the upper back one side at a time. It targets a wide range of muscles including the lats (latissimus dorsi), traps, rhomboids, and rear deltoids. It also targets the biceps to a lesser degree. The single-arm row can work well in a variety of rep ranges but is most popular in muscle-building workouts or as an accessory movement for strength workouts.',
                          'Strength',
                          6,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          518,
                          '48848808e0509a10834acf7c8c6a3a53',
                          'Smith machine bent-over row',
                          'The Smith machine bent-over row is an upper-body exercise targeting the muscles of the back, particularly the lats (latissimus dorsi). This movement can be programmed in low reps for strength or higher reps for muscle and strength endurance. It is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or back-focused workout.',
                          'Strength',
                          7,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          519,
                          'aa0a355eb3d436b7bb3e8ee2657759de',
                          'Leverage High Row',
                          'The machine high row is an exercise targeting the lats and works the back overall.',
                          'Strength',
                          7,
                          12,
                          2
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          520,
                          '9ae1f2e5545e688e1dbd5695294517da',
                          'Machine Low Row',
                          'The machine low row is a popular exercise targeting the back muscles, particularly the lats (latissimus dorsi), rhomboids, and middle and lower trapezius. Machine row variations are often performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or back-focused portion of a workout.',
                          'Strength',
                          7,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          521,
                          '04163c138b3ad62c132ebeede9f650ac',
                          'Standing lat pull-down',
                          'The standing lat pull-down is a variation of the lat pull-down performed standing next to a cable stack rather than sitting on a bench or machine. It has all of the same benefits of a lat pull-down performed on a bench or machine, in addition to providing further activation to the core and lower body. If you are too tall to perform this movement, a kneeling lat pull-down provides all of the same benefits.',
                          'Strength',
                          7,
                          12,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          522,
                          '1556045ebfd8675bd965d6b14c9fef67',
                          'Band seated row',
                          'The band seated row is a band alternative to the popular cable exercise and trains the muscles of the upper back, including the lats (latissimus dorsi), traps, rhomboids, and rear deltoids. It also targets the biceps to a lesser degree. The band row can work well in a variety of rep ranges, requiring a heavier band for muscle-building and strength workouts and a lighter band for weight-loss work and as an accessory movement.',
                          'Strength',
                          1,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          523,
                          '06af722ff94d5ef03c6a13e278c2ef92',
                          'Barbell shrug',
                          'The barbell shrug is an exercise targeting the traps (trapezius muscles). It is popular in strength and muscle-focused upper-body training, and is often trained on a shoulder day. With the assistance of straps, it can be loaded heavily, but it is still usually performed for moderate to high reps, such as 8-10 reps per set.',
                          'Strength',
                          2,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          524,
                          'b06b6cc036919628b7d8c356c69c9a9b',
                          'Barbell behind-the-back shrug',
                          'The barbell behind-the-back shrug is an exercise targeting the traps. Having the bar behind you helps keep your shoulders pulled up and back, rather than rounded forward. It is popular in strength and muscle-focused upper-body training, and is often trained on a shoulder day. With the assistance of straps, it can be loaded heavily, but it is still usually performed for moderate to high reps, such as 8-10 reps per set.',
                          'Strength',
                          2,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          525,
                          'd86c71cccf08ac3fe36c90b076ca45aa',
                          'Single-arm inverted row',
                          'The single-arm inverted row is a bodyweight exercise targeting the muscles of the lats (latissimus dorsi) and upper back, using the bar of the Smith machine to hang and pull from. You can change the bar height to customize the difficulty level and desired angle of the row.',
                          'Strength',
                          2,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          526,
                          'a0f37db32187a472336b4b5478357c89',
                          'Kettlebell sumo deadlift high pull',
                          'The kettlebell sumo deadlift high pull is a dynamic kettlebell exercise that focuses on the muscles of the posterior chain, including the hamstrings, glutes, traps, rear delts, and upper back. It can be done in lower reps for power or strength, or higher reps for conditioning and fat loss. It can also be a component of a circuit-style kettlebell workout, either for time or reps.',
                          'Strength',
                          3,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          527,
                          'e6a572b98e8054591ee44d008d45363e',
                          'Standing dumbbell shrug',
                          'The standing dumbbell shrug is a popular movement to build and strengthen the trapezius muscles. It''s often trained on a bodybuilding-style shoulder or back training day, but can also work well in full-body or strength-focused training.',
                          'Strength',
                          4,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          528,
                          'aaf5eb50fc0a28d4b7adcbe5b81cb1ef',
                          'Standing dumbbell upright row',
                          'The standing dumbbell upright row is a popular movement for building stronger and bigger traps and shoulders. Many lifters combine this move with either their back or shoulder workout, since it involves both body parts. It is generally performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          4,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          529,
                          '0f44560eeab3279e4779aa207ce6de6c',
                          'Dumbbell pull-over',
                          'The dumbbell pull-over is a popular muscle and strength-building exercise that targets the muscles of the chest, upper back, lats, and the serratus anterior. It was a favorite of old-school bodybuilders, who believed high-rep pull-overs helped build a V-taper shape in the torso.',
                          'Strength',
                          4,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          530,
                          '0957cd909ae06a7b3c31c16bfb59c404',
                          'Single-arm dumbbell row',
                          'The single-arm dumbbell row is a popular exercise for building the latissimus dorsi, or lat, muscles of the back. It is most often performed for moderate to high reps, such as 8-12 reps per arm or more, as part of a muscle-building upper-body or back-focused portion of a workout.',
                          'Strength',
                          4,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          531,
                          '578c5d353142c9ec161e253ca22468df',
                          'Cable straight-bar upright row',
                          'The cable straight-bar upright row is an isolation exercise for the traps and the medial deltoids. It may not be appropriate for all lifters depending on their shoulder health and injury history. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          6,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          532,
                          'a5a4963b1a52410a629f42bfa1ab1799',
                          'Cable shrug',
                          'The cable shrug is an exercise targeting the traps, as well as hitting the shoulders and upper back. Cables allow for lighter loading which is beneficial for higher-rep sets.',
                          'Strength',
                          6,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          533,
                          '826aacbaf5876974567331cfccf9d594',
                          'Smith machine shrug',
                          'The Smith machine shrug is an upper-body exercise targeting the traps (trapezius muscles). It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of shoulder or trap-focused training.',
                          'Strength',
                          7,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          534,
                          '8cd6658c26fe087c9b84c755d9a02c96',
                          'Smith machine behind-the-back shrug',
                          'The Smith machine behind-the-back shrug is an upper-body exercise targeting the traps (trapezius muscles). It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of shoulder or trap-focused training.',
                          'Strength',
                          7,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          535,
                          'f53d8919f47f0eb9dd3d3fa1759a3a29',
                          'Smith machine upright row',
                          'The Smith machine upright row is an upper-body exercise targeting the muscles of the traps and shoulders. This movement is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          7,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          536,
                          '375bd131613b438d5aefceb7dfb8fdd6',
                          'Smith machine single-arm shrug',
                          'The Smith machine single-arm shrug is an upper-body exercise targeting the traps (trapezius muscles). It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of shoulder or trap-focused training.',
                          'Strength',
                          7,
                          13,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          537,
                          'a75042f4129c23697910814fa18fbb9b',
                          'Single-leg depth squat',
                          'The single-leg depth squat is an exercise targeting the muscles of the lower body, including the quads, glutes, and hamstrings. It is sometimes used as a substitute for the pistol squat, since it doesn''t demand the same level of flexibility to perform. It is usually performed for low to moderate reps with a focus on proper form and control.',
                          'Strength',
                          1,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          538,
                          'd68f1222df3f270da074d4077633c41f',
                          'Banded jump squat',
                          'The banded jump squat is an explosive bodyweight squat variation performed with a band around the thighs just above the knees. This increases muscle activation in the hips and glutes, while the squat targets the quads, hamstrings, and glutes. The banded jump squat can be performed for low reps as a power-focused exercise, or for higher reps to build muscle in the lower body, challenge conditioning, and burn fat.',
                          'Strength',
                          1,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          539,
                          'd5e25a17c0fb1537736d59ce9374942b',
                          'Band split squat',
                          'The band split squat is a band movement targeting the quads, glutes, and hamstrings. It can be performed either for time or reps, and is often included as part of a fat-loss or athleticism-focused circuit workout. Leaning back places more emphasis on the glutes and hamstrings, while standing straight up targets the quads.',
                          'Strength',
                          1,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          540,
                          'a4d333229b71e0bada5c5d31d3e8edd3',
                          'Band front squat',
                          'The band front squat is a popular exercise for targeting the muscles of the lower body, including the quadriceps, glutes, and hamstrings. Holding band in the racked position also works the core and upper-back muscles to maintain posture while the lower body moves. Because the tension of the band changes as it stretches, the resistance more closely matches the natural strength curve of the squat. This movement is usually performed for moderate to high reps, at least 8-12 reps per set or more. If this movement hurts your knees, try performing it with a wider stance.',
                          'Strength',
                          1,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          541,
                          'a34963f90ebaa78c2fe8382fe8ebe1ac',
                          'Squat hold with band pull-apart',
                          'The squat hold with band pull-apart is a combination of the squat hold and band pull-apart. It involves holding the squat position with the thighs at or below parallel to the ground while performing a band pull-apart. The band pull-apart is an exercise targeting the upper back muscles, including the trapezius, rear delts, and rhomboids. The squat hold band pull-apart can be performed for mobility purposes or to increase time under tension on lower-body muscles including the quads, glutes, and hamstrings.',
                          'Strength',
                          1,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          542,
                          'b26a10f9836abcf6e847e4e63b18b35d',
                          'Banded squat toe tap',
                          'The banded squat toe tap is a banded variation on the classic bodyweight squat, but with a lateral toe tap to add extra focus to the stabilizer muscles around the hips. It can be performed for time or for reps as part of a dynamic warm-up for the lower body, or in any lower-body portion of a workout.',
                          'Strength',
                          1,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          543,
                          '9dc555ba86ae89d654d64c8b8e8725ed',
                          'Band overhead squat',
                          'The band overhead squat is a full-body, functional movement that works to build full-body strength and stability. It is a variation of the classic barbell exercise and can be used to train core strength and stability for Olympic weightlifting or CrossFit.',
                          'Strength',
                          1,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          544,
                          '392ff4e4b9c90cff870c756f7fe61413',
                          'Barbell Full Squat',
                          'The barbell back squat is a popular compound movement that emphasizes building the lower-body muscle groups and overall strength. It''s the classic way to start a leg day, and is a worthy centerpiece to a lower-body training program. The squat is a competitive lift in the sport of powerlifting, but is also a classic measurement of lower-body strength. With the barbell racked on the traps or upper back, the emphasis is placed on the posterior chain but the entire body gets worked. The back squat can be trained in everything from heavy singles to sets of 20 reps or higher.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          545,
                          'df6ce4740511d39041b895796a12458d',
                          'Barbell walking lunge',
                          'The barbell walking lunge tests your ability to maintain balance while challenging the quads, glutes, and hamstrings as well as the core muscles. Using a barbell allows you to overload the exercise. It can be performed for moderate reps, such as 8-15 per set or across the gym, or for higher reps as a conditioning and mental toughness challenge.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          547,
                          '72ba4bdc139d68b6eee9c563e71f6b12',
                          'Barbell front squat',
                          'The barbell front squat is a compound movement that emphasizes building the lower-body muscle groups. With the barbell racked in front of the body on the anterior delts, the front squat emphasizes the quads and glutes, but also upper back and core strength to remain upright. Front squats can be trained as an alternative to back squats, as an accessory movement for either squats or deadlifts, or for strength and muscle on their own. Many lifters and athletes prefer them to back squats, although they can be uncomfortable and difficult to learn at first.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          548,
                          'ad768d9599bf8a9747aa9893bafbfc21',
                          'Smith machine box squat',
                          'The Smith machine box squat is a machine-based exercise targeting the quads, glutes, and hamstrings. The Smith machine mimics a barbell but provides more stability. This movement can be programmed in low reps for strength or power or higher reps for muscle and strength endurance. It is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of a full-body or lower-body workout.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          549,
                          '143f3d6f74ef101bbdf375847f19bc08',
                          'Barbell step-up',
                          'The barbell step-up is a great exercise for building lower-body strength and power. It targets all the same muscles as bodyweight step-ups, such as the quads, glutes, and hamstrings, but allows for greater muscular overload.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          550,
                          'bbeb534e569ec4ccb76d7edfc2cca62a',
                          'Barbell Bulgarian split squat',
                          'The barbell Bulgarian split squat is a single-leg exercise targeting the quads, glutes, and hamstrings. It is easier to overload with the barbell than when using dumbbells. If balance is an issue, consider using a Smith machine or holding dumbbells at your side instead.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          551,
                          '6ded129376007eb4622233e02622643b',
                          'Hack Squat',
                          'The hack squat is a machine-based exercise that targets the muscles of the legs, particularly the quadriceps. It is often used as an accessory for squats, but can also be the main lower-body movement in a workout. It is often performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          552,
                          '20ef67204bfba2f9b84131f18719c78c',
                          'Barbell thruster',
                          'The barbell thruster is a full-body exercise that incorporates both squatting and pressing in one functional movement. It''s especially common in contemporary CrossFit workouts, but also in general strength training. The barbell is usually cleaned into place first, but it could be performed taken from a squat rack in a front-rack position. The thruster can be performed in traditional strength-focused rep ranges to build strength in the press, or in higher reps for full-body conditioning.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          554,
                          '5f47822cc95747b3cb17874c3dbdce3e',
                          'Barbell side split squat',
                          'The barbell side split squat is a variation of the split squat that targets the lower body, specifically the quads, and requires good hip mobility.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          555,
                          'f6cb644f893e96066629e75eafc8cf9f',
                          'Barbell speed squat',
                          'The barbell speed squat targets the lower-body muscle groups using lighter weights to perform fast-paced back squats. Speed squats are popular in certain powerlifting training methodologies as a way to engrain form and lifting speed that can carry over to max-effort lifts. In this approach, they are usually performed in numerous sets of 3-5 reps with adequate rest in between. Speed squats are also sometimes performed with bands or chains adding extra resistance to the top half of the lift.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          556,
                          '43fa2719b9203fdd6d42ac1bed9b94d5',
                          'Barbell reverse lunge',
                          'The barbell reverse lunge is a popular lower-body exercise targeting the quads, glutes, and hamstrings. Using a barbell allows you to overload the exercise beyond body weight and perform the movement in strength or muscle-focused rep ranges. The reverse lunge can be performed as part of a barbell complex, in a circuit, or on its own in the lower-body portion of any workout.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          557,
                          '3e157ed2b5c85d24b660ae97a8349f13',
                          'Close-stance dumbbell front squat',
                          'The close-stance dumbbell front squat is a popular exercise for targeting the muscles of the lower body, the quadriceps in particular. Holding dumbbells in the racked position also works the core and upper-back muscles to maintain posture while the lower body moves. Because the amount of weight you can use will be limited by what you can clean to the rack position, this movement is usually performed for moderate to high reps, at least 8-12 reps per set or more. If this movement hurts your knees, try performing it with a wider stance.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          558,
                          '6c43f4335beea17b2f7e9060e9a9d761',
                          'Barbell Front-To-Back Squat',
                          'The barbell front squat to back squat is a complex that combines two fundamental barbell squat movements with a press in between to build overall strength, coordination, and endurance. This combo hits every muscle in the lower body, but also seriously challenges the upper-body musculature to control and transition the weight.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          560,
                          '9cb38e0fd37c7486b1a7405fe2301c55',
                          'Barbell step-down reverse lunge',
                          'The barbell step-down reverse lunge is an exercise targeting the lower body, particularly the glutes and hamstrings. The front foot is slightly elevated during this movement, making the subsequent step-down more pronounced and difficult. These are usually performed for time or for relatively high reps, such as 10 reps or more per set.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          561,
                          '54afb015530a57f6be458cf3ea1a6774',
                          'Goblet Squat',
                          'The goblet squat is a popular lower-body exercise where you hold a kettlebell or dumbbell in front of your chest as if you are supporting a heavy cup or goblet. It can help lifters of all levels improve their squat technique and hip mobility, but can also work as a muscle-building or strength accessory movement for experienced athletes. It also works well in combinations, complexes, and flows with other kettlebell movements like swings, presses, and cleans.',
                          'Strength',
                          3,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          562,
                          '0936ee776488b3c9a0775fc2a85c11da',
                          'Kettlebell side squat',
                          'The kettlebell side squat is a popular movement to build mobility and lateral strength in the hips. It can be performed for time or for reps, either on its own or as part of a kettlebell circuit, complex, or flow.',
                          'Strength',
                          3,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          563,
                          'afecdad96f7328ea58cc38f10007fe06',
                          'Kettlebell sumo squat',
                          'The kettlebell sumo squat is a lower-body movement emphasizing the muscles of the hips, glutes, and quads. It shares attributes with both the kettlebell deadlift and the goblet squat, but is usually performed with a wider stance and the feet pointed more outward, similar to a sumo deadlift. Its unique stance helps the lifter keep an upright torso, as well as emphasize stretching the hips and adductor muscles.',
                          'Strength',
                          3,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          564,
                          'cdea0b79561acf1f5386a623f5a74462',
                          'Kettlebell thruster progression',
                          'The kettlebell thruster progression is a kettlebell combination movement that includes a squat, curl, press, and overhead extension in a single sequence. It can work well with a light or moderate weight either for time or reps, in circuit-style training, or as a single kettlebell "flow."',
                          'Strength',
                          3,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          565,
                          '93c756963946c00515289a76624532cc',
                          'Kettlebell power clean',
                          'The kettlebell power clean is an explosive kettlebell exercise where the lifter pulls the weight to shoulder level with a slight swing between the legs. It is often used as a drill to teach kettlebell clean technique, but is also a valuable power exercise in its own right. It can be performed in low rep ranges for strength or higher rep ranges for technique practice or muscle growth.',
                          'Strength',
                          3,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          566,
                          'b8da8c95a313fd71a6a9f104ac54cb6d',
                          'Single Arm Overhead Kettlebell Squat',
                          'The single-arm kettlebell overhead squat is a popular kettlebell movement performed while holding a single kettlebell in a locked-out overhead position. It targets the muscles of the lower body dynamically, while also challenging and building shoulder stability and upper-back mobility. It can be trained in traditional strength or muscle-building rep ranges, in circuit or fat-loss training, or as part of a kettlebell combination or complex.',
                          'Strength',
                          3,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          567,
                          '6c7eb638cd9876d187361580312240a4',
                          'Pulsing goblet squat',
                          'The pulsing goblet squat is a simple way to make a popular squat variation more taxing for the lower body and cardiovascular system. They can be done for time or reps, allowing you to get a significant training effect from a light weight in circuit-style training.',
                          'Strength',
                          3,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          568,
                          'b6702c8ad0eb61086a4ec81e3ce56204',
                          'Double-kettlebell front squat',
                          'The double-kettlebell front squat is a popular kettlebell movement performed while holding two kettlebells in the front-racked position. It targets the muscles of the lower body dynamically, and the muscles of the upper back and core isometrically. It can be trained in traditional strength or muscle-building rep ranges, in circuit or fat-loss training, or as part of a larger kettlebell combination or complex.',
                          'Strength',
                          3,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          569,
                          'ee58cd498a3ade8d3688f228d7f92e8f',
                          'Single-arm kettlebell front squat',
                          'The single-arm kettlebell front squat is a popular kettlebell movement performed while holding a single kettlebell in the front-racked position. It targets the muscles of the lower body dynamically, and the muscles of the upper back and core isometrically. It can be trained in traditional strength or muscle-building rep ranges, in circuit or fat-loss training, or as part of a kettlebell combination or complex.',
                          'Strength',
                          3,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          570,
                          'd57f44574cd5907c37c5b10329172d72',
                          'Kettlebell front rack lunge',
                          'The kettlebell front rack lunge is a dynamic leg and core exercise in which a lifter performs lunges while holding a single kettlebell in the front-racked position. It is a unique coordination challenge, but also challenging to the musculature of the abdomen, lower body, shoulders, and upper back. It is most commonly performed for higher reps, such as 10-15 reps per side, or for time. It can work in circuit-style workouts, as well as in muscle or strength-focused workouts.',
                          'Strength',
                          3,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          571,
                          '8909cd81d7fd005e3921ab4b288e7f47',
                          'Dumbbell Goblet Squat',
                          'The goblet squat is a common exercise used in the early stages of learning to squat, or as a movement in general training programs for building size to the quads, glutes, and hamstrings.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          572,
                          '21f4d60d1a4fc5b5dc44a9c15fd9e1e8',
                          'Dumbbell squat',
                          'The dumbbell squat is a classic lower-body exercise that targets the quadriceps, hamstrings, and glutes. While this variation is usually performed with relatively light weights for high reps, it can also be used as a substitute for squats or the trap-bar deadlift in any workout.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          573,
                          '29bd8ca13f9fbae1d910d670d894c09e',
                          'Dumbbell Lunges',
                          'The dumbbell split squat is a popular lower-body exercise to build strength and muscle one leg at a time. It can be used to teach proper lunge form, but is also valuable on its own when trained in traditional strength-focused rep ranges, such as 5-8 reps per set, or for higher reps to build muscle or for conditioning.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          574,
                          '05c6601e70073d90dd5ecfa8458844fd',
                          'Dumbbell reverse lunge',
                          'The dumbbell reverse lunge is a popular lower-body movement that targets the muscles of the quads, glutes, hamstrings, and hips. It also works the core and upper-back muscles to maintain posture while the lower body moves. Lunge variations are often performed for moderate to high reps, such as 8-12 reps per leg or more, as part of the lower-body portion of a workout. If this movement hurts your knees, try performing split squats instead.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          575,
                          '82fbea784fe10598863b6500f8b4490c',
                          'Split Squat with Dumbbells',
                          'The dumbbell Bulgaria split squat is a single-leg exercise targeting the quads, glutes, and hamstrings.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          576,
                          'fc6fe7f0ce055048be7cdc712308886d',
                          'Dumbbell sumo squat',
                          'The dumbbell sumo squat is a popular lower-body movement using a single dumbbell held in front of the legs. It is performed with a wider than shoulder-width stance, which increases the demand on the glutes, hamstrings, and adductors while still benefiting the quads, core, and upper body. It is usually performed for moderate to high reps, at least 8-12 reps per set, as part of the lower-body portion of a workout.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          577,
                          '3d0b061247418a902312f573e9a25211',
                          'Dumbbell thruster',
                          'The dumbbell thruster, which begins with a squat and ends with an overhead press, works the entire body at once in a single fluid motion. This exercise is often performed with kettlebells, but dumbbells are also a great option.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          578,
                          'd11e3dbff02c0317ab710f53ad1aea64',
                          'Dumbbell front squat',
                          'The dumbbell front squat is a popular exercise for targeting the muscles of the lower body, including the quadriceps, glutes, and hamstrings. Holding dumbbells in the racked position also works the core and upper-back muscles to maintain posture while the lower body moves. Because the amount of weight you can use will be limited by what you can clean to the rack position, this movement is usually performed for moderate to high reps, at least 8-12 reps per set or more. If this movement hurts your knees, try performing it with a wider stance.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          579,
                          '421b60eb8b14ea1e6f4a20dee408aac5',
                          'Dumbbell lunge with biceps curl',
                          'The dumbbell lunge with biceps curl combines an isometric hold at the bottom of a lunge with a dumbbell biceps curl. The two exercises combine to target the legs, core, and biceps. The curl will determine the amount of weight you can use, but even a light weight will make the lunge hold seriously challenging.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          580,
                          '497908171cbc3711c027b0de1c30fe11',
                          'Single-leg dumbbell Romanian deadlift',
                          'The single-leg dumbbell Romanian deadlift is a movement targeting the muscles of the hamstrings, glutes, and back. The difference between a Romanian deadlift and a stiff-legged deadlift is the amount of knee bend. The knees are only slightly bent in a stiff-legged deadlift, while they bend more in a Romanian deadlift. Single-leg deadlifts are generally performed for low to moderate reps, such as 8-10 reps per set, with a focus on maximizing the hamstring stretch rather than moving heavy weight. If balance is a challenge, this movement is still very effective if performed while holding on to a stable object for support.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          581,
                          '90d771c571e49da873d47fd8fd9ce47f',
                          'Seesaw lunge',
                          'The seesaw lunge is a bodyweight exercise that combines both the forward and the reverse lunge. It can also be performed holding dumbbells or other weights. It can be performed for time or reps in the lower-body portion of any workout.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          583,
                          '5da6ba25be81c8625196320173b1e4e6',
                          'Dumbbell deadlift',
                          'The dumbbell deadlift is a movement that targets the hamstrings, glutes, and back muscles. While it can be performed all the way from the ground, in the style of a barbell deadlift, it is more often performed from the top down as a Romanian deadlift. The dumbbell deadlift can be performed in low rep ranges to build posterior strength, or for moderate to high reps to build muscle and endurance.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          584,
                          'c298909837e9c5e3134ad61b8760c06c',
                          'Single-arm stiff-legged deadlift',
                          'The single-arm stiff-legged deadlift is a dumbbell exercise that targets the hamstrings, glutes, lower and upper back, and core. The difference between a stiff-legged deadlift and a Romanian deadlift is primarily the amount of knee bend. The knees are only slightly bent in a stiff-legged deadlift, while they bend more in a Romanian deadlift. Stiff-legged deadlifts are generally performed for low to moderate reps, such as 8-10 reps per set, with a focus on maximizing the hamstring stretch rather than moving heavy weight. Feel free to wear a weight belt to protect your lower back.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          585,
                          '4bb28e67159ddbdaca770bf0d4596533',
                          'Dumbbell racked reverse lunge',
                          'The dumbbell racked reverse lunge is a popular lower-body movement that targets the muscles of the quads, glutes, hamstrings, and hips. Holding dumbbells in the racked position further challenges the core and upper-back muscles to maintain posture while the lower body moves. Lunge variations are often performed for moderate to high reps, such as 8-12 reps per leg or more, as part of the lower-body portion of a workout. If this movement hurts your knees, try performing split squats instead.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          586,
                          'cc28b5b7f458582ea5d1895c670ff3fb',
                          'Single-arm dumbbell snatch-',
                          'The single-arm dumbbell snatch is an explosive exercise that builds full-body power and targets the muscles of the hips, back, and shoulders. It involves lifting a dumbbell from the ground to overhead in a single movement. It can be performed for low reps with a focus on power and speed, or for higher reps to build muscle or as part of a metabolic conditioning circuit.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          587,
                          '1813e82272fb056d643893efbfd62fff',
                          'Single-arm dumbbell front squat',
                          'The single-arm dumbbell front squat is an exercise that targets the quads, glutes, and hamstrings, as well as the upper body. It also challenges oblique strength due to the offset loading. It can be performed in strength and muscle-focused workouts, in circuit training, or as part of a larger dumbbell complex with movements like single-arm dumbbell clean and presses.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          588,
                          '23cd015c9aed3c7bc680d1821cbca5b0',
                          'Dumbbell jump squat with rotation',
                          'The dumbbell jump squat with rotation is a popular movement combining an explosive lower-body movement with extra upper-body loading in the form of dumbbells held in the hands. Each jump ends with the body turned 90 degrees, adding a rotational power component to the lift. It is usually performed with light weights for high reps in fat-loss and conditioning workouts.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          589,
                          '576f671eef7551ffd9196bfb1ccc957d',
                          'Dumbbell step-down reverse lunge',
                          'The dumbbell step-down reverse lunge is an exercise targeting the lower body, particularly the glutes and hamstrings. The front foot is slightly elevated during this movement, making the subsequent step-down more pronounced and difficult. These are usually performed for time or for relatively high reps, such as 10 reps or more per side.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          590,
                          '9e911fc9c06f420ce60da7a657a7c3a7',
                          'Hex-bar deadlift',
                          'The hex bar deadlift is a variety of deadlift performed in a hexagonal barbell also known as a trap bar. The bar is held with a parallel (palms in) grip outside of the legs. It is biomechanically different from a barbell deadlift in that it lines up with a lifter''s center of gravity, rather than placing the weight in front of their body. It activates all of the same muscle groups as conventional or sumo deadlifts, including the glutes, quads, hamstrings, lower back, lats, upper back, and grip.',
                          'Strength',
                          5,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          591,
                          '3ff9daa5bde9df9dffdfb23ed0924e4e',
                          'Weighted sissy squat',
                          'The weighted sissy squat is an exercise primarily targeting the quadriceps. In sissy squats, the knees travel over the toes, placing the quads under a fairly extreme stretch. They are usually performed for moderate to high reps as part of a lower-body training session.',
                          'Strength',
                          5,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          592,
                          '57d4cc2a286edff33e7a103cca9f268d',
                          'Dumbbell step-up',
                          'The dumbbell step-up is a great exercise for building lower-body strength and power. It targets all the same muscles as bodyweight step-ups, such as the quads, glutes, and hamstrings, but allows for greater muscular overload.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          593,
                          'b8dc427b0c1e5d1dc989401ce7039892',
                          'Barbell squat with plate slide',
                          'The barbell squat with plate slide is an exercise targeting the quadriceps, with the plate slide also working the adductors and abductors. It can help you get more total-leg and hip development out of squats, but is probably not the sort of thing you want to do with a seriously heavy load on your back.',
                          'Strength',
                          2,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          594,
                          '2f9f477d1acae83d7e8a43918a903974',
                          'Suspended split squat',
                          'The suspended split squat is a single-leg squat variation performed with the rear leg in a suspension strap system. This allows the rear leg to move slightly more naturally than it would be able to on a bench. The exercise targets the quads, hamstring, and glute muscles on the front leg, but also taxes and stretches the quads on the rear leg.',
                          'Strength',
                          5,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          595,
                          '0f06457be337faab159e65c38b5d2cd0',
                          'Dumbbell Walking Lunge',
                          'The dumbbell walking lunge is a popular lower-body movement that targets the muscles of the quads, glutes, hamstrings, and hips. It also works the core and upper-back muscles to maintain posture while the lower body moves. The dumbbell walking lunge is often performed for moderate to high reps, such as 8-12 reps per leg or more, as part of the lower-body portion of a workout. If this movement hurts your knees, try performing reverse lunges or split squats instead.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          596,
                          '7f670e98175a084c0c37adaa18280f85',
                          'Single-leg knee-tap squat',
                          'The single-leg knee-tap squat is a single-leg squat variation that involves “floating” the back leg over the ground on the descent until touching just the knee to the ground or a pad. It is similar to a lunge, but without touching the back foot to the ground. It is an intense strength and coordination challenge that can work in any strength- or athleticism-focused workout.',
                          'Strength',
                          5,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          597,
                          '479c2d4a9b145d3de6f1db16359b848d',
                          'Hybrid deadlift',
                          'The hybrid deadlift is a version of the barbell deadlift in which the lifter''s stance is wider than a conventional position, but narrower than a wide sumo deadlift. The feet are just outside the shoulders and grip placement is just inside of the legs. Many non-competitive lifters find this position to be more spine friendly and strong than either of the other traditional stances. This variation of the deadlift has all the same benefits as the others, and is capable of building serious full-body and posterior chain strength.',
                          'Strength',
                          5,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          598,
                          'd1553a6af072fa9e668914bbeae053ee',
                          'Landmine squat',
                          'The landmine squat is a lower-body exercise that uses an angled barbell anchored at floor level in a landmine device. It can also be performed by sticking a barbell in the corner of a room, preferably in a towel to protect the walls. The landmine squat is similar in many ways to a goblet squat, but with slight differences due to the angle of the barbell. It can be trained in traditional muscle and strength-focused rep ranges or for higher reps.',
                          'Strength',
                          5,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          599,
                          '402e2959f95d89475e0238c950faaaea',
                          'Dumbbell Bulgarian split squat',
                          'The dumbbell Bulgarian split squat is a single-leg exercise targeting the quads, glutes, and hamstrings. Overloading the movement with dumbbells usually presents less of a balance challenge than putting a barbell on the back. Dumbbell split squats are usually performed for moderate to high reps, such as 8-12 reps per leg, but they are also effective done with heavier weights in lower rep ranges.',
                          'Strength',
                          4,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          600,
                          'be19c1a327089d3a0ec5eb653592c4d9',
                          'Single-Leg Press',
                          'The single-leg leg press is a machine exercise targeting the leg muscles, including the quads, glutes, and hamstrings. The leg press is often used as an accessory for squats or deadlifts, but can also be the main lower-body movement in a workout. It is often performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          601,
                          '6d549a150bc455957973fe41f56fcb0b',
                          'Leg Press',
                          'The leg press is a machine exercise targeting the leg muscles, including the quads, glutes, and hamstrings. It''s a favorite among lifters who prefer the seated position to standing with a load on the spine. The leg press is often used as an accessory for squats or deadlifts, but can also be the main lower-body movement in a workout. It is often performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          602,
                          '89951291ffee3462dc73029aafca04a2',
                          'Narrow-stance leg press',
                          'The narrow-stance leg press is a machine-based exercise that targets the muscles of the legs. It emphasizes the quads, particularly the muscles of the outer quads and hips. It is often used as an accessory for squats, or as a muscle-building movement during lower-body training when it is usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          603,
                          '86dbf384a7a2006994c0ad5f57cc9102',
                          'Smith machine back squat',
                          'The Smith machine back squat is a machine-based exercise targeting the muscles of the lower body. The Smith machine mimics a barbell but provides more stability. This movement can be programmed in low reps for strength or higher reps for muscle and strength endurance. It is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of a full-body or lower-body workout.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          604,
                          'c5b4870a2df2acd4dec203df13379ce3',
                          'Leg Extensions',
                          'The leg extension is an isolation exercise for the quads.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          605,
                          '6d4cd466d8ae3fe75799bdac20f58cdb',
                          'Smith machine leg press',
                          'The Smith machine leg press is a machine-based movement that targets the quads, glutes, and hamstrings. It can serve as a substitute for the leg press or be programmed similarly to the leg press. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of lower-body training. If your Smith machine has safety bars, set them at a height that allows you a full range of motion while giving adequate protection from the weight potentially falling.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          606,
                          '0e917b9ea3d722e10a619ac1ab7d5cd7',
                          'Seated Leg Press',
                          'The seated leg press is a machine-based exercise that targets the quads, glutes, and hamstrings. It is similar in many ways to larger leg press machines, but often utilizes a selectorized weight stack rather than plate loading. Leg press variations are often used as an accessory for squats or deadlifts, but can also be the main lower-body movement in a workout. This movement is often performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          607,
                          '46e71a98e4e8f272f75836cfec567916',
                          'Smith machine pistol squat',
                          'The Smith machine pistol squat is a machine-based exercise that targets the quads, glutes, and hamstrings. It is similar in form to a pistol squat but is performed with a bar on the shoulders. This adds extra resistance, but also eliminates some of the balance challenge of single-leg squats. This squat variation can be performed in low reps for strength or for higher reps for muscle gain.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          608,
                          'e0de1d0742c923424851e64c7c365b48',
                          'Smith machine front squat',
                          'The Smith machine front squat is a machine-based exercise targeting the muscles of the lower body. The Smith machine mimics a barbell but provides more stability. This movement can be programmed in low reps for strength or higher reps for muscle and strength endurance. It is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of a full-body or lower-body workout.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          609,
                          'fcc5b6ca6a682dec9aa78d00f0b9fee5',
                          'Single-leg hack squat',
                          'The single-leg hack squat is a lower-body exercise mainly targeting the quads, performed one side at a time per set. It is often used as an accessory for squats, or as a muscle-building movement during lower-body training, and is usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          610,
                          '86f50233674af0803c4b66ce233f3dcd',
                          'Narrow-stance hack squat',
                          'The narrow-stance hack squat is a machine-based exercise that targets the muscles of the legs, particularly the quadriceps. It is often used as an accessory for squats, or as a muscle-building movement during lower-body training, and is usually performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          611,
                          '7d5ddc618b76686fd35bbfdb79f2afe9',
                          'Smith machine lunge squat',
                          'The Smith machine lunge squat is an exercise targeting the quads, glutes, and hamstrings. Using added weight allows you to overload the exercise beyond body weight and perform the movement in strength ranges. The Smith machine mimics a barbell but provides more stability.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          612,
                          '0ba99e503f462727e7a82d54729ffb99',
                          'Leg extension',
                          'The leg extension is a popular machine-based exercise for the legs, particularly the quadriceps. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of a leg pre-exhaust or as a muscle-building movement for lower-body training.',
                          'Strength',
                          7,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          613,
                          'af30604d6bb072412070214df39c8609',
                          'Forward lunge',
                          'The forward lunge is a lower-body bodyweight exercise targeting the quads, glutes, and hamstrings. It can also be performed holding dumbbells or other weights. The forward lunge places more emphasis on the quads than other lunge variations. It can be performed for time or reps in the lower-body portion of any workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          614,
                          'd45bca784d86db3f74f38aa2bd5d4373',
                          'Bodyweight squat',
                          'The bodyweight squat is a fundamental exercise that strengthens the quads, glutes, and hamstrings. It can be performed as part of a dynamic warm-up, for time or reps during a workout, or for hip and spine mobility any time.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          615,
                          'cc94354fe9b6236d1463bbb376c406e0',
                          'Arms-crossed jump squat',
                          'The arms-crossed jump squat is an explosive version of the jump squat. Crossing your arms eliminates any extra power that could come from swinging your arms, making the movement extra strict and challenging for the lower body. It can be performed for time or reps and is especially effective in a fat-loss or athleticism-focused circuit or workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          616,
                          '48f6d04fce3b69f8c26c004eb8827715',
                          'Bodyweight Reverse Lunge',
                          'The reverse lunge is a lower-body exercise targeting the quads, glutes, and hamstrings. The reverse lunge places more emphasis on the glutes than other lunge variations.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          618,
                          '7859e885fb5dc1b247f29087f6911831',
                          'Lateral lunge',
                          'The lateral lunge is a lower-body bodyweight movement that works the quads, glutes, and hamstrings. It can also be performed holding dumbbells or other weights. It is often performed for reps as part of a dynamic warm-up or mobility routine but can also work in a circuit or other workouts.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          619,
                          '39b1242c07084ef7744a2b7f331ff441',
                          'Thigh killa',
                          'The thigh killa is a challenging lower-body bodyweight exercise that builds muscular endurance with a series of hops and bodyweight squats. It can be performed for time or reps, usually in a circuit workout or as a lower-body finisher.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          620,
                          '777aae93b0045f5cd95cdd1d345413de',
                          'Wall squat',
                          'The wall squat is a bodyweight exercise targeting the quadriceps, as well as other muscles in the lower body and core. The lifter''s back is flat against a wall, and the back slides down and up the wall during each rep. If you don''t have a smooth wall to slide on, the exercise can also be performed with an exercise ball between the back and the wall.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          622,
                          'd8f12422e0901b1f71823a2bda1d8c66',
                          'Single-leg box squat',
                          'The single-leg box squat is a bodyweight exercise that targets the muscles of the lower body, including the quads, glutes, and hamstrings. It is similar in form to a pistol squat, except that you sit to a box. This allows you to customize the depth of the movement to your movement abilities and mobility level. For this reason, the single-leg box squat is a popular movement for building leg strength in beginning trainees. It can be performed in lower strength-focused rep ranges, such as 5-8 reps per leg, or for higher reps for muscle building.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          623,
                          '19276a9607ab6dd3ada6e642b2de1ffd',
                          'Seal jack',
                          'The seal jack is a variation on the jumping jack, one the most common calisthenic exercises on the planet. The difference between this movement and the jumping jack has to do with the arm motion. Instead of the arms coming together overhead, they come together in front of the body, like a seal clapping its fins.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          624,
                          '085c1ac6ecd355514454b9466ca7c54b',
                          'Kneeling quad thoracic stretch',
                          'The kneeling quad thoracic stretch is a stretch targeting greater range of motion in your thoracic spine. It is commonly included in dynamic warm-ups or cool-downs, but can also be performed as full-body mobility work any time.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          625,
                          '948ce4e5be88e1a2bdcdc08590839288',
                          'Wall sit',
                          'The wall sit is an exercise targeting the quadriceps and core muscle. It involves descending into a squat position while leaning against a wall, then holding that position for a predetermined length of time. It''s a classic leg endurance-building exercise for basketball players and gymnasts.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          626,
                          '2eae3bb9e18a9717bb9dc924eb60c843',
                          'Walking lunge with hip extension',
                          'The walking lunge with hip extension is a combination of two movements, both targeting the lower body. The added hip extension places more of an emphasis on the glutes. It is a great inclusion in a dynamic warm-up for the lower body, but can also be performed for time or reps in any workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          627,
                          '94ff3fbfaa7b99686b5e3c9aa423c1c4',
                          'Squat with alternating side leg raise',
                          'The squat with alternating side leg raise is a bodyweight version of the squat, but with a lateral leg lift to add extra focus to the abductor muscles. It can be performed for time or for reps as part of a dynamic warm-up for the lower body, or in any lower-body portion of a workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          629,
                          '80b32d2210733b3a90c4a75c0aef50de',
                          'Walking lunge with twist',
                          'The walking lunge with twist is an exercise that targets the lower body and the obliques. The twist not only works the obliques, it also opens up the thoracic spine. It is a great inclusion in a dynamic warm-up for a lower-body or full-body workout, but can also be performed for time or reps in any workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          630,
                          '24d963f51d7459ac1e84060cec3d4dbf',
                          'Push-up sprawl tuck jump',
                          'The push-up sprawl tuck jump is an explosive bodyweight sequence that combines three movements: the push-up, the sprawl, and the tuck jump. It is similar to a burpee, but with a tuck jump at the top. It can be performed for time or reps in any fat-loss or athleticism-focused circuit or workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          631,
                          '75c227a2b8bcb269129ffd4d1fdb3af1',
                          'Jump squat-',
                          'The jump squat is an explosive bodyweight exercise targeting the quads, hamstrings, and glutes. It is also a serious cardiovascular challenge when done for reps. It can be performed as a power exercise to build jumping power, or in any fat-loss or athleticism-focused workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          632,
                          'bb5690443773be8a88951dfc248eef4b',
                          'Single-leg burpee',
                          'The single-leg burpee is an advanced variation of the burpee exercise that involves performing all parts of the sequence with one leg at a time. It is usually performed alternating legs with each rep, but could be performed one side at a time. Performing one leg at a time increases the challenge to all parts of the body, especially the working leg, core, and shoulders.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          633,
                          '04508868775bcb9a153cc8168b7e567c',
                          'Banded compass jump squat',
                          'The banded compass jump squat is an explosive squat variation performed with a band around the thighs just above the knees. This increases muscle activation in the hips and glutes, while the squat targets the quads, hamstrings, and glutes. The landing for each jump is a 90-degree rotation from the starting position. The banded compass jump squat can be performed for low reps as a power-focused exercise, or for higher reps to build muscle in the lower body, challenge conditioning, and burn fat.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          634,
                          '5f45fe4b5bb61718ca5605bf2a773bdb',
                          'Knee-tuck kick-up',
                          'The knee-tuck kick-up is a bodyweight movement that targets the muscles of the abs, the rectus abdominis or "six-pack" muscles in particular. It can be performed for time or reps in the ab-focused portion of any workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          635,
                          'd977685e293dc1149178479471638d39',
                          'Bear crawl donkey kick',
                          'The bear crawl donkey kick is a more advanced version of the bear crawl exercise that adds a donkey kick. It adds an extra coordination and shoulder challenge to an already intense full-body movement that targets the cardiovascular system as well as a wide range of muscle groups, the shoulders, core, and legs in particular. It can be done as a full-body warm-up, in short bursts for power or circuit training, or for longer durations as cardiovascular conditioning.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          636,
                          '4a43ae4f1cee8381e89d2db8b98fa812',
                          'Southpaw sprawl with push-up',
                          'The southpaw sprawl with push-up is a full-body movement that combines elements of a plank and a sprawl, with the addition of a push-up. It also has a rotational component, with a jumping leg-cross and torso twist in a straight-arm plank position. It is a challenging move that trains balance, core strength, and many muscle groups, making it work well in a time-efficient bodyweight circuit workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          637,
                          '32dd95c56798f97e4ce8fcda4eebfeed',
                          'Bouncing lunge',
                          'The bouncing lunge is a bodyweight movement targeting the quads. It can be performed either for time or reps, and is often included as part of a fat-loss or athleticism-focused circuit workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          638,
                          'b333423c969251d9c45b63efccb67cd9',
                          'High knees sprawl drill',
                          'The high knees sprawl drill is a full-body, cardio and strength-focused exercise. It can be performed for reps or time in a fast-paced circuit or other workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          639,
                          '45ccc6ba58a304d42f6deec9eecc2b7e',
                          'Bootstrapper squat',
                          'The bootstrapper squat is a movement that improves mobility, muscular strength, and flexibility in the hips and hamstrings. It is usually performed as part of a dynamic warm-up for the lower body to mobilize the hips and improve squat form.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          640,
                          '334a2325b0bf7297dd37392f30159442',
                          'Lateral shuffle',
                          'The lateral shuffle is a common exercise in sports training and gym classes. It involves taking steps to one side and then steps to the other side. It can be performed as part of a circuit for athletes of any level, but is also a great movement for beginners.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          641,
                          'e8e502e4669186e4d99fbed0c0efc3c2',
                          'Spider lunge stretch',
                          'The spider lunge stretch is a lower-body stretch targeting the hips, groin, and quads. It can be part of a dynamic warm-up or mobility work performed anytime.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          642,
                          '38eed36b89b7ce5b98332b03cb22fc01',
                          'Spider lunge with T-rotation',
                          'The spider lunge with T-rotation is an exercise that produces a deep stretch in the glutes and hamstrings while also rotating and mobilizing the thoracic spine region. It is a great movement to include in a dynamic warm-up, or as mobility work anytime.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          643,
                          'edd11589ef548960eb5d77754320ae1f',
                          'Standing quad stretch',
                          'The standing quad stretch is a simple exercise designed to stretch the quadriceps, the big muscles that cover most of the thighs. This is a static stretch, meaning it’s usually performed by holding the stretched position for a certain length of time.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          644,
                          'd9fee288e2f8e63c57fbee9f3f33171a',
                          'Vertical jump',
                          'The vertical jump is an explosive lower-body exercise that is a common way to measure explosive hip and lower-body strength in athletes. The more explosive you are, the higher you''ll be able to jump.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          645,
                          'd0de180622f4e648b1aaf23665f11958',
                          'Lunge high-knee clap',
                          'The lunge high-knee clap is a full-body, cardio-based exercise with emphasis on the lower body. It includes a clap under the front leg to make the movement more powerful and strict. It can be performed either for time or reps and is a great inclusion in a fat-loss or athleticism-focused circuit workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          646,
                          '0d904be831f52dfb178a69e362b677c3',
                          'Sprinter burpee',
                          'The sprinter burpee is an explosive version of the burpee exercise that adds a sprinter jump to the top of each rep. It can be performed for time or reps in any fat-loss or athleticism-focused circuit or workout.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          647,
                          'e46ecb704dbdbb3f99d8d9ab853dbc6a',
                          'Shuttle run training',
                          'Shuttle run training is an athletic conditioning drill that’s great for developing speed and power, as well as changing direction. It’s a favorite of football and basketball players, but it can also be great conditioning work for lifters and athletes of all ability levels.',
                          'Strength',
                          8,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          648,
                          '989d1af5540ab8f01bfa9667d6935d2d',
                          'Medicine ball cowboy squat',
                          'The medicine ball cowboy squat is an explosive exercise targeting the lower body, although several upper-body muscles play important supporting roles. The move involves performing jumping squats while holding a medicine ball overhead. It''s commonly performed as part of a bodyweight and medicine ball circuit focused on fat loss or athleticism.',
                          'Strength',
                          9,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          649,
                          'fe6fade5059ef72f8b55884445260e18',
                          'Medicine ball jumping jill',
                          'The medicine ball jumping jill is an explosive medicine ball exercise that is similar to a jumping jack but performed holding a medicine ball between the hands. It can be performed for time or reps in a dynamic warm-up or fat-loss or conditioning circuit, usually paired with other bodyweight or medicine ball movements.',
                          'Strength',
                          9,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          650,
                          '287f2c3c3c6259f3b5df9ed1989cc09e',
                          'Smith machine lunge sprint',
                          'The Smith machine lunge sprint is a lower-body power exercise performed with the bar of a Smith machine on the back. It is similar to an alternating jump lunge or "scissor lunge," but with added weight. The contained bar of the Smith machine makes it safer and less of a balance challenge than using a free weight.',
                          'Strength',
                          10,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          651,
                          'c6925d9f96243e78020cd67729d92e05',
                          'Sissy squat',
                          'The sissy squat is a bodyweight squat variation that involves letting the knees travel far over the toes, placing an extreme stretch on the quads. This movement targets the quad muscles directly and can be performed in partial or full ranges of motion based on knee health and pain.',
                          'Strength',
                          10,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          652,
                          '1c9b7e56b389128c05c9bb5c88a08127',
                          'Exercise ball Bulgarian split squat',
                          'The exercise ball Bulgarian split squat is an exercise that builds the quads, hamstrings, and glutes one leg at a time. The exercise ball is used to support the trailing shin and foot. Due to the balance challenge, this version of the split squat is usually performed for moderate to high reps with body weight only or light weights in the hands. If balance is a problem, you can stick the ball in the corner of a room while performing the exercise.',
                          'Strength',
                          11,
                          14,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          653,
                          '10d2c36aa92ddb9765e3c3794893d5d2',
                          'Band Pull Apart',
                          'The band pull-apart is an exercise targeting the upper back muscles, including the trapezius, rear delts, and rhomboids. The band creates dynamic tension, allowing you to really focus on contracting these muscles, making it a great activation drill prior to upper-body lifting.',
                          'Strength',
                          1,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          654,
                          '452224e5503546fd01f307bdbaae24d5',
                          'Band shoulder press',
                          'The band shoulder press is a deltoid exercise and an alternative to the classic dumbbell shoulder press. The dynamic tension of the band forces the core to stabilize the body and more closely matches the strength curve of the shoulder press. It can be performed in low reps, such as 5-8 reps per set, to build shoulder strength, or for higher reps to build muscle and for conditioning. It can work as the main focus of a shoulder day but is also popular as an accessory movement to the bench press or barbell military press.',
                          'Strength',
                          1,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          655,
                          'ec8df8f10a9bb51902720305e11417ae',
                          'Band lateral raise',
                          'The band lateral raise is a shoulder exercise that targets the medial or middle head of the deltoid muscle. It''s a variation of the dumbbell lateral raise, a staple strength-training move. The band lateral raise is a great option for warm-up or accessory work on upper-body training days. The dynamic tension of the band provides constant tension and matches the strength curve of the movement. It is usually performed for moderate to high reps, at least 8-12 reps, as part of the upper-body or shoulder-focused portion of a workout.',
                          'Strength',
                          1,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          656,
                          '36f7b5eeb46b3ab4b7b237f31a38aa77',
                          'Band upright row',
                          'The band upright row is a popular movement for building stronger and bigger traps and shoulders and similar to the dumbbell upright row. Many lifters combine this move with either their back or shoulder workout, since it involves both body parts. Using the band provides dynamic resistance and is easier on the shoulder than using a barbell. It is generally performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          1,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          657,
                          'c643beccd96eca8b23a5e392b7b59826',
                          'Staggered-stance band shoulder press',
                          'The staggered-stance band shoulder press is a deltoid exercise and a variation of the band shoulder press. The dynamic tension of the band forces the core to stabilize the body, and the staggered-stance provides more stability and relieves tension on the back. It can be performed in low reps, such as 5-8 reps per set, to build shoulder strength, or for higher reps to build muscle and for conditioning. It can work as the main focus of a shoulder day but is also popular as an accessory movement to the bench press or barbell military press.',
                          'Strength',
                          1,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          658,
                          '92ab486dda81270008e6740a19278c6d',
                          'Single-arm banded landmine press',
                          'The single-arm banded landmine press is an upper-body exercise that uses an angled barbell anchored at floor level in a landmine device. It can also be performed by sticking a barbell in the corner of a room, preferably in a towel to protect the walls. The band adds constant tension and dynamic resistance to the exercise. The movement focuses primarily on the muscles of the shoulders or deltoids and can be trained in traditional muscle and strength-focused rep ranges or for higher reps.',
                          'Strength',
                          1,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          659,
                          'e0c77bc046e9d555164cd8db5dfeb8d7',
                          'Band front raise rear fly row combo',
                          'The band front raise rear fly row combo is a combination of three different shoulder exercises to build and strengthen the anterior, middle deltoids, and posterior portions of the shoulders. It requires a continuous loop band to provide constant, dynamic tension throughout the movement. In addition to the front and rear delts, this exercise works the arms, chest, back, and core, making it a great time-efficient shoulder burnout or accessory movement on an upper-body day.',
                          'Strength',
                          1,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          660,
                          '2c9e0cb5c239916bb525aa30a76f4b0f',
                          'Clean and press',
                          'The clean and press is a full-body lift comprised of two movements: the clean, where the bar is pulled from the floor and caught in the front rack position in three pulls or phases, followed by the overhead press. Decades ago, it was contested in the Olympics. Today, it remains a worthy centerpiece of a power and strength training program, and has full-body benefits when done for low reps as well as moderate to high reps.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          661,
                          '4a747102bf5a62511895d31fe8a948ba',
                          'Military press',
                          'The military press is a compound movement used to build size and strength in the shoulders. It was once contested as a fourth powerlift, but is rarely competed anymore. However, being able to press a significant weight overhead remains a popular marker of upper-body strength. The military press can be trained as a strength lift or in traditional muscle-building rep ranges as part of full-body, shoulder-focused, or upper-body training.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          662,
                          '0d34358aacc882306dd9130ac52e2b88',
                          'Seated barbell shoulder press',
                          'The seated barbell shoulder press is a classic exercise for building muscle and strength in the shoulders. The triceps also play a significant role in pressing the barbell overhead. Performing the movement seated reduces help from the lower body and decreases the risk of overextending the lumbar spine during the movement. This press variation can be the primary pressing movement on an upper-body or shoulder day, or an effective accessory movement later in a workout.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          663,
                          'f044da72d0b1caa094d12b28a2d411c7',
                          'Standing Bradford press',
                          'The standing Bradford press is an obscure yet effective shoulder exercise that alternates front presses with behind-the-neck presses. It can be used as a warm-up for other press variations on a shoulder day, or as a muscle-building movement on its own in a shoulder or upper-body focused workout. It is usually performed for relatively high reps, such as 8-15 reps per set or higher, or just to the point of fatigue.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          664,
                          'd3a9c7cf64841f05542cd05dc06507a1',
                          'Barbell Shoulder Press',
                          'The seated barbell shoulder pressis a classic exercise for building muscle and strengthening the shoulders, particularly but not exclusively the front heads. The triceps also play a significant roles in pressing the barbell overhead.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          665,
                          'cf3eb8ad9682863980c9bc629b29d0ff',
                          'Barbell rear delt bent-over row',
                          'The barbell rear delt bent-over row is a movement used to target the shoulders as well as the upper-back muscles. It is performed with lighter weights than a traditional barbell bent-over row, and is usually performed for higher reps, such as 8-15 reps per set, as part of a back or upper-body workout.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          666,
                          '6a654f8a1228cad53c9841f61f37f436',
                          'Barbell upright row',
                          'The barbell upright row is a barbell exercise that builds stronger and bigger traps. Many lifters combine this move with either their back or shoulder workout since it involves both body parts.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          667,
                          'a7f72d5f67bdc17c9f242357257e6512',
                          'Lying rear delt fly',
                          'The lying rear delt fly is an upper-body exercise that targets the rear deltoid of the shoulder. By performing the movement lying face down on a bench, it eliminates momentum from the rest of the body. This movement is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or shoulder-focused portion of a workout.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          668,
                          'c853bd4496bedf76e583ebe640ea01b1',
                          'Machine Shoulder (Military) Press',
                          'The machine shoulder press is an upper body exercise targeting the deltoids.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          669,
                          '9e7f729c0d9885ffadb67680f769b0a6',
                          'Standing Barbell Press Behind Neck',
                          'The standing behind-the-head press is a classic shoulder exercise that was used widely during bodybuilding''s professed Golden Era. In addition to the deltoids, it also works the trapezius and triceps muscles. It may not be a good choice for some people''s shoulders, depending on their injury history. It can be trained in strength-focused rep ranges, but is more commonly trained in moderate to high reps, such as 8-15 reps per set.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          670,
                          '0f9cacfdd89d35068d3fde321d33fca6',
                          'Barbell front raise',
                          'The barbell front raise is an upper-body isolation exercise that targets the shoulders. It is usually performed for moderate to high reps, such as 8-12 reps or higher, as part of the shoulder-focused part of any workout.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          671,
                          '9546a23e6f4e3953c7e07ccefbffbc2b',
                          'Overhead bar front raise',
                          'The overhead bar front raise is an exercise targeting the muscles of the traps (trapezius), especially the upper traps, as well as the front or anterior shoulders. It can also be performed with a weight plate or dumbbell, providing a neutral grip that may be more shoulder-friendly for some lifters. Overhead raises are most common for high reps (at least 8-12 reps per set or higher) on a shoulder, trap, or other upper-body-focused muscle-building day.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          672,
                          'd57c35cbb5c276f45c49151e7fa51aef',
                          'Incline barbell shoulder protraction',
                          'The incline barbell shoulder protraction is an upper-body movement that targets strength and mobility in the scapula or shoulder blades. This can help increase pressing strength and prevent injury. It also helps develop the serratus anterior, an often-neglected muscle around the ribcage that can aid in shoulder health and upper-body muscle definition. Because it targets such small muscles, this exercise is usually performed with light weight for high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          673,
                          'cffb33bce99716c33a2e34686915f079',
                          'Seated EZ-bar shrug',
                          'The seated EZ-bar shrug is an exercise targeting the trapezius muscle, that V-shaped muscle that forms a triangle where the shoulders meet the neck. It is usually performed for moderate to high reps during an upper-body or shoulders and traps-focused workout.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          674,
                          'd541cb4e6669e0179437d345859fffa3',
                          'Single-arm barbell lateral raise',
                          'The single-arm barbell lateral raise is an isolation exercise targeting the shoulders. It is more challenging than using a dumbbell and has an instability component that may make the deltoid muscles work harder. It is generally performed one side at a time for moderate to high reps, such as 8-15 reps per set, as part of a shoulder-focused workout.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          675,
                          'c41c5ee8e6b2598ffabee04149b9903c',
                          'Standing barbell shoulder press',
                          'The standing barbell shoulder press is a compound movement used to build size and strength in the shoulders. The shoulder press can be trained as a strength lift or in traditional muscle-building rep ranges as part of full-body, shoulder-focused, or upper-body training.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          677,
                          'eb5435050148e3c5d3336c65c4e6d657',
                          'Barbell bear complex',
                          'The barbell bear complex is a series of barbell lifts that run together in a single sequence: a barbell power clean, front squat, push-press, back squat, and another push-press from behind the neck. It trains the entire body for both building strength and improving conditioning. It is often performed for rounds, either with or without rest between rounds.',
                          'Strength',
                          2,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          678,
                          'b9caa69dded5cca35111b3d08d30c2a8',
                          'Single-arm kettlebell push-press',
                          'The single-arm kettlebell push-press is a popular kettlebell movement that involves performing a press with help from the muscles of the lower body. It is preceded by a clean at the start of each set, and optionally you can perform a clean between each rep. It can be trained in traditional strength or muscle-building rep ranges, in circuit or fat-loss training, or as part of a larger kettlebell combination or complex.',
                          'Strength',
                          3,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          679,
                          'a661b3d7daacda8579865a9fb10de952',
                          'Single-arm kettlebell snatch',
                          'The single-arm kettlebell snatch is a kettlebell exercise that involves lifting a kettlebell overhead in a single motion. It is popular as a full-body strength and conditioning movement, but it''s also competed for reps in Russian-style girevoy sport. A "snatch test" of max reps in 5 or 10 minutes is also a common measurement of conditioning in kettlebell training. It can be performed from the ground or with a swing',
                          'Strength',
                          3,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          680,
                          'c67d0c9418c67dfabe2491622149c967',
                          'Single-arm kettlebell clean and jerk',
                          'The single-arm kettlebell clean and jerk is a popular kettlebell movement that is performed both in an exercise setting and competitively as a part of Russian-style girevoy sport. It differs from a clean and push-press in that the lifter "dips" under the weight rather than simply using the legs to help push the weight up. Each rep of a clean and jerk is preceded by a clean at the start of each set. It can be trained in traditional strength or muscle-building rep ranges, in circuit or fat-loss training, or as part of a larger kettlebell combination or complex.',
                          'Strength',
                          3,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          681,
                          'b5632a81fe91e268635433157732629f',
                          'Kettlebell pirate ship',
                          'The kettlebell pirate ship is a rotational shoulder and core-focused kettlebell movement. It demands the lifter raise the kettlebell to the side in both directions, emphasizing core strength in the transverse abdominis and obliques in particular. It is best learned with a light weight, using controlled movements in both directions.',
                          'Strength',
                          3,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          682,
                          'cf49c99d39d65d2e58c3cb62a580df27',
                          'Double Kettlebell Push Press',
                          'The double-kettlebell push-press is a popular kettlebell movement that involves performing a press with help from the muscles of the lower body. It is preceded by a double clean at the start of each set, and optionally you can perform a clean between each rep. It can be trained in traditional strength or muscle-building rep ranges, in circuit or fat-loss training, or as part of a larger kettlebell combination or complex.',
                          'Strength',
                          3,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          683,
                          'f10dd186b10f71b8c3e48a35aad07856',
                          'Double-kettlebell windmill',
                          'The double-kettlebell windmill is an advanced kettlebell exercise emphasizing core strength and shoulder and hip mobility and stability. Because it involves holding one weight overhead while holding another under the torso, it builds strength across the core and stability in the shoulders. It doesn''t work well in a metcon or conditioning setting, and shouldn''t be performed under intense fatigue.',
                          'Strength',
                          3,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          684,
                          '9d4bf09bf1daa82d340ee1e180e0c0e2',
                          'Kettlebell upright row',
                          'The kettlebell upright row is an exercise targeting the muscles of the traps (trapezius), as well as the posterior muscles of the shoulders or deltoid muscles. It is common as a light- or moderate-weight accessory movement in upper-body or shoulder training, usually in rep ranges of 8-12 or more. It may not be appropriate for some people, depending on their shoulder health.',
                          'Strength',
                          3,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          685,
                          '3ecbae9312def331bf63447a4c93b80d',
                          'Kettlebell upright row and press',
                          'The kettlebell upright row and press is a combination of two popular kettlebell movements in a single sequence. This combination can be performed for time or for reps, often as circuit-style training for conditioning or fat loss, or in a kettlebell complex or flow.',
                          'Strength',
                          3,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          686,
                          '1ae839ac09b6eb46cf05d7a1e5a5c0ba',
                          'Single-arm kettlebell thruster',
                          'The single-arm kettlebell thruster is a popular kettlebell movement that combines a kettlebell front squat with a kettlebell press. It is preceded by a clean at the start of each set, and you can perform a clean between each rep if you choose. It can be trained in traditional strength or muscle-building rep ranges, in circuit or fat-loss training, or as part of a kettlebell combination or complex.',
                          'Strength',
                          3,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          687,
                          'd775a6940809a5db6763115553573460',
                          'Double-kettlebell shoulder press',
                          'The double-kettlebell shoulder press is a popular movement in strength and muscle-focused kettlebell workouts. Each set is started by cleaning the weights up to the rack position. The weights can optionally be re-cleaned between each rep, which is known as a clean and press. The double press can be trained in traditional strength or muscle-growth rep ranges (e.g., 5x5 or 8-12 reps per set), or in circuit-style fat-loss training or kettlebell complexes.',
                          'Strength',
                          3,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          688,
                          'da0c51b4fa2494a683ac63fa99b1e9b9',
                          'Single-arm palm-in dumbbell shoulder press',
                          'The single-arm palm-in dumbbell shoulder press builds the shoulder muscles but with two major differences from the standard dumbbell shoulder press. It''s done one arm at a time and the wrist stays neutral throughout the movement. It can be performed standing or seated. A single dumbbell press can be pursued as a strength goal, or trained in traditional muscle-building rep ranges such as 8-15 reps per set or more.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          689,
                          'b8989e776b62d226cec7dde451d289f7',
                          'Standing palms-in shoulder press',
                          'The standing palms-in shoulder press is a dumbbell exercise targeting the shoulders. It can be performed in strength-focused rep ranges, such as 5-8 reps per set, or for higher reps to build muscle or for conditioning.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          690,
                          '53efacfc50deb2a1bc578b90346f57c7',
                          'Seated Dumbbell Press',
                          'The seated dumbbell shoulder pressis an exercise for building muscle and strengthening the shoulders, particularly but not exclusively the front heads. The triceps also assist. Some lifters feel that using dumbbells versus a barbell reduced injury risk.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          691,
                          'a3e1ef5de7177ab06d666add8eee04c0',
                          'Standing dumbbell shoulder press',
                          'The standing dumbbell shoulder press is a classic deltoid-building exercise that is common in gyms around the world. Performing the move standing up as opposed to seated allows more weight to be used and taxes the core more than seated presses. The standing press is worthy of being the main movement in a muscle-building shoulder workout, but is also a great strength movement and accessory for the bench press.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          692,
                          '47bdf8081129cdd5cf6cd5c40b115fdd',
                          'Single-arm lateral raise',
                          'The single-arm lateral raise is a shoulder exercise that targets the medial or middle head of the deltoid muscle. It''s a staple strength-training move and is a great option for accessory work on upper-body training days. Hold on to a post for balance, or do it free-standing to challenge core strength and stability. It is usually performed for moderate to high reps, at least 8-12 reps per side, as part of the upper-body or shoulder-focused portion of a workout.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          693,
                          '517305ab2e2b70cad91db65da00ef590',
                          'Incline dumbbell reverse fly',
                          'The incline dumbbell reverse fly is an upper-body exercise targeting the posterior or rear deltoids, as well as the postural muscles of the upper back. Because it targets such small muscles, this exercise is usually performed with light weight for high reps, such as 10-15 reps per set or more.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          694,
                          '401462b7424a9d904903231390562d40',
                          'Overhead dumbbell front raise',
                          'The overhead dumbbell front raise takes the dumbbell front raise one step further, extending the motion all the way above the head. In addition to the shoulders, it activates and strengthens the muscles of the traps and upper back. It is usually performed for moderate to high reps, such as 8-15 reps or more. It can be part of a dynamic upper-body warm-up, performed as a muscle-building upper-body movement, or as a burnout movement on shoulder day.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          695,
                          '638df318c50b84f73fc9176b7ad90f26',
                          'Seated dumbbell shoulder press',
                          'The seated dumbbell shoulder press is a popular exercise for building muscle and strength in the shoulders. The triceps also work hard in this lift. Many lifters find using dumbbells to be more comfortable and shoulder-friendly for this press variation than a barbell. This can be the primary pressing movement on an upper-body or shoulder day, or an effective accessory movement later in a workout.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          696,
                          'ac4ed383e71d1aa5830b0f716b0b3ac3',
                          'Alternating standing shoulder press',
                          'The alternating standing shoulder press is a popular dumbbell exercise targeting the shoulders. It can be performed in strength-focused rep ranges, such as 5-8 reps per set, or for higher reps to build muscle or for conditioning.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          697,
                          '73edff6e4b694584dd1efb4fe20ea72f',
                          'Single-arm incline rear delt raise',
                          'The single-arm incline rear delt raise is an upper-body exercise targeting the posterior deltoids or shoulder muscles, as well as the postural muscles of the upper back. Training each side independently can help correct imbalances in size, strength, and shoulder stability. Because it targets such small muscles, this exercise is usually performed with light weight for high reps, such as 10-15 reps per set or more.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          698,
                          '6859650a9ed9560c484f82ee2ba4e7df',
                          'Alternating dumbbell front raise',
                          'The alternating dumbbell front raise is a single-joint exercise targeting the shoulder muscles, particularly the front or anterior deltoids. Performing the movement one shoulder at a time gives a momentary rest to each side while the other is working, potentially allowing you to do more reps during each set. It is usually performed for moderate to high reps, at least 8-12 reps per set, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          699,
                          'eb7982876dfed922da1a5b26b13caa45',
                          'Alternating Deltoid Raise',
                          'The dumbbell front raise to lateral raise combines two exercises that build and strengthen the middle deltoids and the anterior deltoids of the shoulders.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          700,
                          'b658f4a75a2efd849e2adb1c4429ae78',
                          'Single-dumbbell front raise',
                          'The single-dumbbell front raise is an isolation movement that targets the shoulders. In particular, it focuses on the anterior or front head of the deltoid muscles. By performing it with one dumbbell at a time, you can focus on each shoulder muscle independently and try to address muscular imbalances between shoulders. This movement is usually performed for moderate to high reps, at least 8-12 reps per set, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          701,
                          '624dbc86441ca3fa191f1a430d992fee',
                          'Single-arm standing shoulder press',
                          'The single-arm standing shoulder press is a popular exercise to build size and strength the shoulders and triceps. Most lifters find they can go heavier (per arm) on this movement than if they are pressing two dumbbells simultaneously, making it an effective strength movement as well as a muscle-building movement in higher reps.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          702,
                          '3ef22b84b97c8b1327650c9b0d4571e3',
                          'Dumbbell front raise',
                          'The dumbbell front raise is a single-joint exercise targeting the shoulder muscles, particularly the front or anterior deltoids. It is usually performed for moderate to high reps, at least 8-12 reps per set, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          703,
                          '4cc99f5cbb7cf584fa23504c3584d6dd',
                          'Bent-over dumbbell rear delt row',
                          'The bent-over dumbbell rear delt row is a popular upper-body exercise that targets the muscles on the backside of the shoulder joint, specifically the medial and rear heads of the deltoid. Since pressing movements build the front and (to a lesser degree) side deltoid heads, this move is often done to promote balanced shoulder development. It is usually performed for high reps, such as 10-15 reps per set or more, as part of a shoulder or upper-body workout.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          704,
                          'b3ac05a4cfccada02763b0e120d79385',
                          'Incline dumbbell front raise',
                          'The incline dumbbell front raise is an upper-body exercise targeting the shoulders. Because it is performed face down on an angled bench, it has a greater range of motion than standing or upright-seated raises and hits the shoulders from a different angle. Raise variations are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or shoulder-focused training.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          705,
                          '5f17ddf53cf7980c27e1895f298710e2',
                          'Side Lateral Raise',
                          'The dumbbell lateral raise is an upper body isolation exercise for building shoulder strength and muscle. It''s a staple strength training move and is a great option for accessory work on upper body training days. This exercise particularly focuses on the lateral or medial head of the deltoid, making them appear wider and more developed.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          706,
                          '3307d187020e036bafb4b3db06073e82',
                          'Dumbbell external shoulder rotation',
                          'The dumbbell external shoulder rotation is a lightweight dumbbell exercise intended to maintain the health of the shoulder joints, including the rotator cuffs. It is often used as a warm-up or prehab for a shoulder or chest-focused workout with lots of pressing.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          707,
                          '57302f03fdf1c2a9cea6d507e7ddebf5',
                          'Single-arm incline lateral raise',
                          'The single-arm incline lateral raise is an exercise targeting the lateral or medial head of the shoulder muscles. It is performed lying sideways on an incline bench set to around 45 degrees, which helps to increase the range of motion in the lift and enforce strict form. Because it targets such small muscles, this exercise is usually performed with light weight for high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          708,
                          'ed8da8a205ffeca2e81cdefcb6824d83',
                          'Seated rear delt fly',
                          'The seated rear delt fly is an upper-body exercise that targets the real deltoid of the shoulder. By performing the movement seated, it eliminates momentum from the rest of the body. This movement is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or shoulder-focused portion of a workout.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          709,
                          '2b40756406fd6ce0afc86bc9c6eeede8',
                          'Seated Side Lateral Raise',
                          'The seated dumbbell lateral raiseis an iconic exercise for developing the shoulders. If you’ve ever worked out with weights, chances are you’ve done this move at some point. Proper execution is paramount to avoid injury.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          711,
                          '0d9ed3a251fccb712e08d1f4006c06c8',
                          'Head-on-bench dumbbell rear delt raise',
                          'The head-on-bench dumbbell rear delt raise is an exercise targeting the posterior shoulder muscles, or rear deltoids. This variation of the bent-over rear delt raise often helps to better isolate this area of the shoulder. Because it targets such small muscles, this exercise is usually performed with light weight for high reps, such as 10-15 reps per set or more.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          712,
                          '8cd99993b671a4bb46e78cd2bbdce366',
                          'Cuban press',
                          'The Cuban press is an exercise that targets the muscles of the shoulders, rotator cuff, and upper back. It combines a shoulder external rotation with a dumbbell press, training multiple muscles and motions in a single sequence. It can be performed standing, or as a more difficult variation face-down on an incline bench. It is usually performed with relatively light weight as part of a dynamic warm-up for upper-body lifting.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          713,
                          '89047b499d4510897ab71f204c4f8708',
                          'Single-arm side lying rear fly',
                          'The single-arm side lying rear fly is an upper-body exercise that targets the rear deltoid of the shoulder. By performing the movement lying on a bench, it eliminates momentum from the rest of the body. This movement is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or shoulder-focused portion of a workout.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          714,
                          'c59fbb4ead05ad3c520f9a0c7f011f23',
                          'Single-arm dumbbell upright row',
                          'The single-arm dumbbell upright row is a popular movement for building stronger and bigger traps and shoulders. Many lifters combine this move with either their back or shoulder workout, since it involves both body parts. It is generally performed for moderate to high reps, such as 8-12 reps per set or more.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          715,
                          'e351357b376377459c9fd7098116659f',
                          'Single-arm half-kneeling shoulder press',
                          'The single-arm half-kneeling shoulder press is a popular exercise to target the deltoid muscles while also developing strength and stability in the core and hips. Balance can be a challenge, which is one reason why this movement is generally trained lighter than standing single-arm shoulder presses. The half-kneeling press can be used as an accessory lift for the shoulder press or bench press, or simply as a technique to make shoulder presses stricter and more athletic.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          716,
                          '20b901e5b83203f9a1e9a46217ef5b40',
                          'Dumbbell shoulder press with body rotation',
                          'The dumbbell shoulder press with body rotation is a twist on the traditional dumbbell shoulder press. Rather than pressing straight overhead, you twist your torso and hips to the side during each rep. It hits the deltoid muscles just like a shoulder press, but adds a challenge to the core, hips, and back muscles. Due to the potential balance challenge of twisting and pressing at the same time, it is commonly performed with light to moderate weights.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          717,
                          '15851a9fbf3dcdfc5b179f78abf7c2ec',
                          'Dumbbell seesaw shoulder press',
                          'The dumbbell seesaw shoulder press is an exercise targeting the deltoids and triceps. The difference between this movement and the alternating shoulder press is that both dumbbells keep moving throughout each rep, rather than having one weight be stationary while the other moves. This piston-style pressing increases time under tension and may allow you to complete more total reps than with alternating reps.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          718,
                          '4111aea0e00a05ac59561ee21e24b310',
                          'Dumbbell hang snatch',
                          'The dumbbell hang snatch is an explosive exercise that builds full-body power and targets the muscles of the hips, back, and shoulders. Performing the movement from the hang position, rather than from the ground, emphasizes explosive hip and upper-body power. It can be performed for low reps with a focus on power and speed, or for higher reps to build muscle or as part of a metabolic conditioning circuit.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          719,
                          '3fab145b0c57cbf20c62e99b6c5e45b1',
                          'Surfer sprawl',
                          'The surfer sprawl is an explosive bodyweight exercise that targets multiple muscle groups across the upper and lower body. It is similar to a burpee, but instead of jumping at the top, you end in a "surfer position," alternating sides with each rep. It can be performed for time or reps in any fat-loss or athleticism-focused circuit or workout. The surfer position offers a unique way to challenge the body by staying in a low position rather than standing up after the plank.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          720,
                          'd30b99fed786a99ff026e902d0948398',
                          'Dumbbell clean and press',
                          'The dumbbell clean and press is a full-body movement that targets both the lower and upper body. The clean utilizes the muscles of the hips, legs, glutes, back, and biceps, while the press utilizes the shoulders and triceps. It can be trained in low to moderate reps for strength, or for higher reps, such as 8-12 reps per set or more, for muscle building or metabolic conditioning.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          721,
                          '8634b3d057d6bec7bf20be1f769749f0',
                          'Dumbbell lateral raise',
                          'The dumbbell lateral raise is a shoulder exercise that targets the medial or middle head of the deltoid muscle. It''s a staple strength-training move and is a great option for accessory work on upper-body training days. It is usually performed for moderate to high reps, at least 8-12 reps, as part of the upper-body or shoulder-focused portion of a workout.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          722,
                          'efa4b8dbb7e23fde1680432afe9e8b0a',
                          'Dumbbell front raise and press',
                          'The dumbbell front raise and press combines two upper-body moves into one challenging sequence targeting the deltoid muscles. It''s a simple way to boost your heart rate while getting a good upper-body pump, and is a natural fit in time-efficient upper-body or circuit training.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          723,
                          'f67ce0726601f7af8130dc18ff722568',
                          'Rotator cuff warm-up',
                          'The rotator cuff warm-up is a simple exercise targeting the rotator cuffs through weighted shoulder external rotation. It''s a classic way to warm up the shoulder prior to sports or training, as well as a common rehab movement. The rotator cuffs are a notorious injury-prone structure in the shoulders of Major League pitchers and other athletes. This is a movement most commonly done for moderate to high reps, such as 8-12 reps or more per set.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          724,
                          'd7de46179eb9da18cdaab6c270b98bef',
                          'Single-arm dumbbell arc row',
                          'The single-arm dumbbell arc row is an exercise for building the latissimus dorsi, or lat, muscles of the back. This variation has more of an arcing shape than the traditional single-arm dumbbell row, which may increase the mind-muscle connection and hit the back from a different angle. You probably won''t be able to go as heavy on this as on a traditional row.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          725,
                          '951a658408a3de9341b20de5e5c37c29',
                          'Seated dumbbell lateral raise',
                          'The seated dumbbell lateral raise is an exercise that targets the shoulder muscles, particularly the medial or middle head of the deltoids. Performing it on a bench helps enforce strict form and eliminate swinging or using momentum to move the weights. Lateral raise variations are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or shoulder-focused portion of a workout.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          726,
                          '7dfb994cbf20169cc94c966301fe0365',
                          'Dumbbell racked carry',
                          'The dumbbell racked carry involves carrying dumbbells for time or distance, while holding them close to the shoulders in a front-racked position. Similar to a dumbbell farmer''s carry, it can be a challenging finisher to any workout, or work well in fat-loss circuit training or as an accessory movement to heavy lifts like the deadlift.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          727,
                          '5610d6e22cd8085896f4c03560cdd464',
                          'Dumbbell clean and push-press',
                          'The dumbbell clean and push-press is a full-body movement that targets both the lower and upper body. The clean utilizes the muscles of the hips, legs, glutes, back, and biceps, while the push-press utilizes the shoulders and triceps. It differs from the clean and press in that the push-press allows you to use lower-body momentum to power through the most difficult part of the press. It can be trained in low to moderate reps for strength, or for higher reps, such as 8-12 reps per set or more, for muscle building or metabolic conditioning.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          728,
                          '0daa45f63e8cf8d2a2a75ab003a0e45b',
                          'Single-arm dumbbell racked carry',
                          'The single-arm dumbbell racked carry involves carrying a single dumbbell for time or distance, while holding it close to the shoulders in a front-racked position. Similar to a dumbbell farmer''s carry, it can be a challenging finisher to any workout, or work well in fat-loss circuit training or as an accessory movement to heavy lifts like the deadlift.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          729,
                          'e94c71d6c002c6c41ba403304570325b',
                          'Dumbbell shadow boxing',
                          'Dumbbell shadow boxing is a more advanced version of a popular conditioning exercise. By adding a pair of lightweight dumbbells, you can greatly increase the challenge to both the shoulders and cardiovascular system.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          730,
                          'aef5706e99ed814768c0d60952870fa6',
                          'Car driver',
                          'The car driver is a variation of the plate front raise exercise where the lifter holds a weight plate in front of them and twists it from side to side, similar to a steering wheel. It targets the muscles of the shoulders, the front or anterior deltoids in particular, but is also challenging to the core and upper-back muscles. It can provide variety in a shoulder-focused muscle-building workout or as part of an upper-body or full-body circuit.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          731,
                          'fde7f5ce06f7ae410ad7f07162be0f7a',
                          'Arnold press',
                          'Named after the iconic bodybuilder and movie star, the Arnold press adds rotation to a classic shoulder press. It allows the hands to rotate naturally, while also hitting all three heads of the deltoids in one motion. It is usually performed for moderate to high reps, such as 8-12 reps or more, as part of the upper-body or shoulder-focused portion of a workout.',
                          'Strength',
                          4,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          732,
                          'b2e502aa74474bb3c1f8a4aedfbc09f7',
                          'Front Plate Raise',
                          'The plate front raise is a variation of the dumbbell front raise where the lifter holds a weight plate between two hands, rather than using a dumbbell, barbell, or other weight. It can provide variety in a shoulder-focused muscle-building workout, or as part of an upper body or full-body circuit.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          733,
                          '1428ccbe2b73b543f296c042ff009418',
                          'Battle ropes',
                          'Battle ropes are an explosive training tool that involves moving the rope in waves with the other end of the rope anchored at ground level. There are many different types of waves, but the most common is alternating waves with the left and right hands. The battle ropes can be performed for short bursts as power training, for longer durations as cardiovascular training, or as a component of a conditioning or fat-loss circuit.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          734,
                          '5d946279e71b6cc92136bde3ee0696a6',
                          'Landmine Linear Jammer',
                          'The linear jammer is an explosive pressing movement performed using an angled barbell anchored at floor level in a landmine device. It can also be performed by sticking a barbell in the corner of a room, preferably in a towel to protect the walls. The linear jammer involves pressing the weight into the air, then catching it with the other hand. The movement focuses primarily on the muscles of the shoulders or deltoids. It can be trained in traditional muscle and strength-focused rep ranges, for lower reps with a focus on explosive pressing power, or for higher reps.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          735,
                          '0a776931e012877231542232bf14615a',
                          'Standing suspended rear delt fly',
                          'The standing suspended rear delt fly is a bodyweight movement targeting the shoulders and upper back using a suspension strap system or gymnastic rings. It can be performed for time or reps as part of a dynamic warm-up for an upper-body strength workout, or in the workout itself either in traditional muscle-building rep ranges or for higher reps.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          736,
                          'fce47f247bc51c6cebe017722aa0e772',
                          'Waiter''s carry',
                          'The waiter''s carry is a type of loaded carry that targets the core, shoulders, and upper back. A weight is raised overhead with a single arm before the lifter begins walking in that position. It resembles a waiter carrying a tray overhead—hence the name. It can be performed for time or distance.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          737,
                          '8d97f88b09bddeb40bcb4d88d0687c3d',
                          'Towel dumbbell front raise',
                          'The towel dumbbell front raise is a variation of the dumbbell front raise that involves hanging a dumbbell from a towel held in the hands. It could also be performed with a kettlebell or weight plate. It can provide variety in a shoulder-focused muscle-building workout or as part of an upper-body or full-body circuit.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          738,
                          '9b29c9b047f0c5807e4ce6f90114ed6a',
                          'Plate lateral raise',
                          'The plate lateral raise is an exercise targeting the side heads of the shoulder muscles or deltoids. It closely resembles the more popular dumbbell lateral raise, but is performed with light plates, making the movement slightly more difficult. It is usually performed for moderate to high reps as part of a shoulder or upper-body workout.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          739,
                          '5a8c4d2ae3c7e1a0a74475d1d0edd332',
                          'Bent-over plate rear delt raise',
                          'The bent-over plate rear delt raise is an exercise targeting the rear heads of the shoulders, or deltoids. You can also use dumbbells or other light weights for a similar effect. This movement is usually performed as part of a dynamic warm-up or as a high-rep burnout movement on a shoulder or back day.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          740,
                          '725855759b3a31a78fae627cf33011ea',
                          'Single-arm landmine press',
                          'The single-arm landmine press is an upper-body exercise that uses an angled barbell anchored at floor level in a landmine device. It can also be performed by sticking a barbell in the corner of a room, preferably in a towel to protect the walls. The angle of a landmine press is usually somewhere between an incline press and a military press, and the movement focuses primarily on the muscles of the shoulders or deltoids. It can be trained in traditional muscle and strength-focused rep ranges or for higher reps.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          741,
                          'e139168052c1f7740642858813213c1e',
                          'Plate front raise',
                          'The plate front raise is a variation of the front raise where the lifter holds a weight plate between two hands, rather than using a dumbbell, barbell, or other weight. It can provide variety in a shoulder-focused muscle-building workout or as part of an upper-body or full-body circuit.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          742,
                          'ed0943592d9c3d53b4a766ee6055c580',
                          'Single-arm landmine push-press',
                          'The single-arm landmine push-press is an explosive upper-body exercise that uses an angled barbell anchored at floor level in a landmine device. It can also be performed by sticking a barbell in the corner of a room, preferably in a towel to protect the walls. The angle of a landmine press is usually somewhere between an incline press and a military press, and the movement focuses primarily on the muscles of the shoulders or deltoids. It can be trained in traditional muscle and strength-focused rep ranges or for higher reps.',
                          'Strength',
                          5,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          743,
                          '1738d33ac5c57d09284d55c4bca20a2a',
                          'Single-arm cable front raise',
                          'The single-arm cable front raise is an isolation exercise targeting the anterior and medial deltoids or shoulder muscles. The single-arm version of this movement allows you to focus on each side independently. Because grip will be a limitation, it is usually performed for moderate to high reps, at least 8-12 reps per set, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          744,
                          '9f84e31208d51194920fce16039ece19',
                          'Seated face pull',
                          'The seated face pull is a cable exercise targeting the shoulder muscles, particularly the rear delts, and the muscles of the upper back. This can help build healthier shoulders and posture, and increase shoulder stability. It is usually performed for moderate to high reps as part of a dynamic warm-up for an upper-body workout or in the main part of a shoulder-focused workout.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          745,
                          '6fa0a2ef666f2ab8e1212a446a46f346',
                          'Single-arm bent-over cable rear delt fly',
                          'The single-arm bent-over cable rear delt fly is an exercise targeting the rear deltoids. It is a great way to isolate this area of the shoulder and attack each side independently. It is usually performed for moderate to high reps, at least 8-12 reps per set, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          746,
                          '1eff3afb16be6203809d987bc3c25b7e',
                          'Seated cable shoulder press',
                          'The seated cable shoulder press is a multijoint machine-based exercise that focuses on the deltoid or shoulder muscles, as well as the triceps. It''s most common in muscle-building workouts and rep ranges, usually 8-12 reps or more.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          747,
                          '2d1d70cd609efab5654e2ab116d5bb87',
                          'Standing face pull',
                          'The standing face pull is an isolation exercise primarily targeting the rear deltoids, traps, and upper back. It is most often performed with a rope attachment.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          748,
                          '9bfcaecb8b664fedfebc36f20ef1796d',
                          'Standing cable rear delt row',
                          'The standing cable rear delt row primarily targets the rear deltoids. This movement also hits the traps, rhomboids, and biceps. It is usually performed for moderate to high reps, at least 8-12 reps per set, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          749,
                          'b162e511fc6a6c2a8add50e4aa0bf6f9',
                          'Standing Low-Pulley Deltoid Raise',
                          'The single-arm cable lateral raise is an isolation exercise targeting the shoulders, specifically the medial deltoid. This movement also hits the traps and upper back, and allows you to focus on each side independently. Because grip is a limitation, it is usually performed for moderate to high reps, like at least 8-12 reps per set, as part of an upper body or shoulders-focused workout.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          750,
                          '61757ab35b4f8ed99b5e392be682bf30',
                          'Standing crossed-cable rear delt fly',
                          'The standing crossed-cable rear delt fly is an isolation exercise for the rear deltoids. It is usually performed for moderate to high reps, at least 8-12 reps per set, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          751,
                          '773456c9c91500d60a7f7022c4baf34c',
                          'Single-arm lying cable front raise',
                          'The single-arm lying cable front raise is an isolation exercise for the shoulders, performed lying on the back, either on a bench or the ground, and lifting the cable over the torso one arm at a time. This movement is usually performed for moderate to high reps for a burn and pump as part of a shoulder-focused workout.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          752,
                          'f984aa4c53e60b36c069b29008064cd4',
                          'Lying cable front raise',
                          'The lying cable front raise is an isolation exercise for the shoulders, particularly the front deltoids. It is performed lying on the back, either on a bench or the ground, with the cable lifted over the torso. This movement is usually performed for moderate to high reps for a burn and pump as part of a shoulder-focused workout.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          753,
                          'c2020edb134e2961b613df3c7cbb48e0',
                          'Lying cable lateral raise',
                          'The lying cable lateral raise is an isolation exercise that targets the medial or middle deltoid muscle of the shoulders. It is most common in muscle-building shoulder or upper-body workouts, usually in higher rep ranges of at least 8-12 reps per set.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          754,
                          'b645a22100019abec87f6d6310726ca6',
                          'Cable seated row',
                          'The cable seated row is a popular exercise to train the muscles of the upper back, including the lats (latissimus dorsi), traps, rhomboids, and rear deltoids, using a cable stack. It also targets the biceps to a lesser degree. The cable row can work well in a variety of rep ranges but is most popular in muscle-building workouts or as an accessory movement for strength workouts.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          755,
                          '44aaa8b5ac25e8207bae6c4e73c6d7f3',
                          'Single-arm cable lateral raise',
                          'The single-arm cable lateral raise is an isolation exercise targeting the shoulders, specifically the medial deltoid. This movement also hits the traps and upper back and allows you to focus on each side independently. Because grip is a limitation, it is usually performed for moderate to high reps, at least 8-12 reps per set, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          6,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          756,
                          'f04b6c0bdaf08b2f62db68393c27c4b1',
                          'Smith machine shoulder press',
                          'The Smith machine shoulder press is a machine-based exercise targeting the deltoid muscles. The Smith machine mimics a barbell but provides more stability. This movement can be programmed in low reps for strength or higher reps for muscle and strength endurance. It is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of a shoulder or upper-body focused workout.',
                          'Strength',
                          7,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          757,
                          'afd729015b39939543d15027ca7b3323',
                          'Machine shoulder press',
                          'The machine shoulder press is a machine-based exercise targeting the deltoid muscles. It approximates the motion of a free-weight shoulder press, but uses a selectorized weight-stack or plate-loaded machine. Many such machines also allow you to choose between different grips and grip widths. Machine shoulder presses are often done for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or shoulder-focused portion of a workout.',
                          'Strength',
                          7,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          759,
                          'bc96cd1ebd6c88c05556348bb880804f',
                          'Single-arm Smith machine upright row',
                          'The single-arm Smith machine upright row is an upper-body exercise targeting the muscles of the traps and shoulders. This movement is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          7,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          760,
                          '864764499f189bec8ca224e1b979a502',
                          'Smith machine behind-the-neck press',
                          'The Smith machine behind-the-neck press is a machine-based exercise targeting the deltoids. The Smith machine mimics a barbell but provides more stability. This movement can be programmed in low reps for strength or higher reps for muscle and strength endurance. It is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of a shoulder or upper-body focused workout.',
                          'Strength',
                          7,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          761,
                          '186b3df4ffd45bf13be0952ab459df4c',
                          'Handstand push-up',
                          'The handstand push-up is an exercise targeting the shoulders, although other muscles assist in the completion of the reps. It is common in both CrossFit workouts and advanced bodyweight or calisthenics training. Given the degree of difficulty, beginners will need to progress to this move.',
                          'Strength',
                          8,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          762,
                          '48986af982368839b06533def631012c',
                          'Hand Stand Push-Up',
                          'The handstand push-up is an exercise targeting the shoulders, although other muscles assist in the completion of the reps. It is common in both CrossFit workouts and advanced bodyweight or calisthenics training. Given the degree of difficulty, beginners will want to progress to this move.',
                          'Strength',
                          8,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          763,
                          '34fe46e214f3890ba5c149dbd0a12205',
                          'Wall walk',
                          'The wall walk is a challenging exercise that works the entire body. From a push-up position, the hands walk back as the feet walk up the wall, then the whole movement is reversed. This is not for beginners, who will need to progress to this exercise.',
                          'Strength',
                          8,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          764,
                          'e3c5466c8c01da9d26acfd667ca9263f',
                          'Wall shoulder tap',
                          'The wall shoulder tap is a bodyweight shoulder exercise that is a popular movement for gymnasts, cheerleaders, and other athletes who need to spend a lot of time in dynamic handstand movements. Beginning in a handstand position with toes touching the wall, one hand is raised to touch the opposing shoulder. This continues in alternating fashion for the duration of the set.',
                          'Strength',
                          8,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          765,
                          'a919d30a39f5960a83f8dc29edaf9453',
                          'Bear crawl shoulder tap',
                          'The bear crawl shoulder tap is a variation of the bear crawl that involves touching the opposing shoulder while in a static bear crawl hold. It adds an extra coordination and core challenge to an already intense full-body movement that targets the cardiovascular system as well as a wide range of muscle groups. It can be done as a full-body warm-up, or as part of a bodyweight circuit or flow.',
                          'Strength',
                          8,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          766,
                          '3beeb296b8266155adf7ab519e18db52',
                          'Shoulder L',
                          'The bent-over shoulder rotation is an upper-body exercise that helps strengthen the muscles around the rotator cuff for a stable shoulder joint. It is usually performed as part of a dynamic warm-up for the shoulders. It can be performed with body weight, light dumbbells or weight plates, or bands.',
                          'Strength',
                          8,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          767,
                          '6e66082792f7bcc113801bc8d6b987ab',
                          'Floor angel',
                          'The floor angel is a stretch targeting shoulder mobility and activation of the shoulder stabilizer muscles. It also targets a range of postural muscles in the upper back.',
                          'Strength',
                          8,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          768,
                          'e8fb37e5419741ff76e3e88747a2041a',
                          'Shoulder extension stretch',
                          'The shoulder extension stretch is focused on bringing more flexibility to the shoulder joint. It increases range of motion in shoulder extension, or moving the arms behind the back. It can be performed as part of a warm-up or mobility and flexibility work post-workout or anytime.',
                          'Strength',
                          8,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          769,
                          'b30c9952611a2ba23e9f9d16f20a93ea',
                          'Incline face-down bar front raise',
                          'The incline face-down bar front raise is an upper-body exercise targeting the shoulders. Because it is performed face down on an angled bench, it has a greater range of motion than standing or upright-seated raises and hits the shoulders from a different angle. Raise variations are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or shoulder-focused training.',
                          'Strength',
                          12,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          770,
                          'bf4cd9dd5656944606a3fa2b7c36b35a',
                          'Incline anti-gravity shoulder press',
                          'The incline anti-gravity shoulder press is an upper-body exercise targeting the shoulders and upper back. It works the rear delts and upper-back muscles isometrically to hold the weight up, while dynamically training the lateral and front delts. Because of the challenge of holding the weight up, this press variation is usually performed with relatively light weights for moderate reps, such as 8-12 reps per set or more, as part of upper-body or shoulder training.',
                          'Strength',
                          12,
                          15,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          772,
                          'c489c623769df1168190ab764d8f0362',
                          'Band overhead triceps press',
                          'The band overhead triceps press is a dynamic arm exercise utilizing a looped exercise band. It could also be performed with an exercise band with handles. It targets the triceps muscles and can be performed for time or reps, either in traditional muscle-building rep ranges such as 12-15 reps per set, or higher rep ranges such as 30, 50, or more.',
                          'Strength',
                          1,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          773,
                          '30ef0a0be6c19b70ee53673ffc182245',
                          'Band overhead triceps extension',
                          'The band overhead triceps extension is a single-joint exercise focused on the triceps that uses the dynamic resistance of the band. The overhead position of the arms targets the long head of the triceps. Many lifters save this move for last in their triceps workout, performing it for moderate to high reps, such as 8-12 reps or more per set.',
                          'Strength',
                          1,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          774,
                          '6e4dfdc17cb70f52f4dad00347ea526f',
                          'Band straight-arm pull-down',
                          'The band straight-arm pull-down is a non-gym or at home variation of the straight-arm lat pull-down performed using a cable stack machine. It can either be performed in an athletic upright stance, or slightly bent over. It both stretches and contracts the muscles of the lats (latissimus dorsi) as well as providing additional activation to the other upper back muscles and the core. Because the triceps are also isometrically involved in the movement, it is usually performed for higher reps, such as 8-15 reps or more.',
                          'Strength',
                          1,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          775,
                          '35240c584b809e13187c3238068353a0',
                          'Band skullcrusher',
                          'The band skullcrusher is a variation of the popular bench exercise targeting the triceps muscles. It is usually performed for moderate to high reps as part of an upper-body or arm-focused workout.',
                          'Strength',
                          1,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          776,
                          'a0bca205d1ae82b4a3a90e19b1cd80e7',
                          'Single-arm band kick-back',
                          'The single-arm band kick-back is an isolation exercise that targets the triceps. This is a common burnout move performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          1,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          777,
                          'e16188a9d280ae83cbbb3e9674c6a89f',
                          'Incline EZ-bar skullcrusher',
                          'The incline EZ-bar skullcrusher is a popular exercise targeting the triceps muscles. The incline angle helps to target the long head of the triceps in particular. This exercise is usually performed for moderate to high reps as part of an upper-body or arm-focused workout.',
                          'Strength',
                          2,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          778,
                          'e81e9f12005d7968144cbdad3edbacdc',
                          'Behind-the-head skullcrusher',
                          'The behind-the-head skullcrusher is a variation on a triceps exercise that has been a staple of bodybuilders for decades. In this version, instead of the bar coming down lightly to the forehead, the bar tracks over the top of the head without touching it. Skullcrushers are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or arm-focused workout. If a straight bar is uncomfortable for your wrists or elbows, try using an angled EZ-bar.',
                          'Strength',
                          2,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          779,
                          'e118c7af77067789687883723b901340',
                          'Standing barbell overhead triceps extension',
                          'The standing barbell overhead triceps extension is an isolation movement targeting the triceps. The overhead position targets the long head of the triceps in particular. This movement is generally performed for moderate to high reps as part of the arms-focused portion of a workout. If holding a straight bar bothers the wrists or elbows, it can alternately be performed with an EZ-bar or neutral-grip bar.',
                          'Strength',
                          2,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          780,
                          '964e9b6099bf73ee72da1f2cf5ce758b',
                          'Reverse-grip bench press',
                          'The reverse-grip bench press is a popular barbell exercise targeting the chest, triceps, and forearms. The main difference between this exercise and the standard bench press is that the grip is underhand, not overhand. This helps target both the upper chest and the triceps. This lift can feel awkward at first, so go light and don''t be afraid to use a spotter.',
                          'Strength',
                          2,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          781,
                          '6cecc1a2bed080ef7013955535d0b60b',
                          'Seated triceps press',
                          'The seated triceps press is a popular arm-building exercise that targets the triceps with a single dumbbell held by both hands, extending it up behind your head. While you can go surprisingly heavy on this movement, it is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or arm-focused portion of a workout. If you''re going heavy, having someone help get the weight into position is a good idea.',
                          'Strength',
                          4,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          782,
                          '51fdee71468e144bf25883130d17d49b',
                          'Tricep Dumbbell Kickback',
                          'The single-arm triceps kick-back is an isolation move from a bent-over position used to increase size and strength of the triceps.',
                          'Strength',
                          4,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          783,
                          '9bebe19a830d6ac8e3bcd8a29b405ad0',
                          'Double-arm triceps kick-back',
                          'The double-arm triceps kick-back is a popular movement to increase size and strength of the triceps. It is usually performed for moderate to high reps, at least 8-12 reps, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          4,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          784,
                          '7324b6367c9435bd74cf4c8aa647ace9',
                          'Single-arm dumbbell triceps extension',
                          'The single-arm dumbbell triceps extension is a popular exercise targeting the triceps one side at a time. It targets all three heads of the triceps, but when performed with the arm overhead, it can be especially effective at building the long head of the triceps. This exercise is usually performed for moderate to high reps, at least 8-12 reps per set, as part of the upper-body or arm-focused portion of a workout.',
                          'Strength',
                          4,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          785,
                          '02aa21f4dfdbc977a76b998802f11a57',
                          'Dumbbell skullcrusher',
                          'The dumbbell skullcrusher is a triceps exercise that has been a staple of bodybuilders for decades. Skullcrushers are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          4,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          787,
                          'd7aadbc3125521780dd430ba7a7d3616',
                          'V-sit with overhead triceps extension',
                          'The V-sit with overhead triceps extension is a hybrid movement that trains the abdominal and triceps muscles simultaneously. It can address multiple muscle groups in a time-efficient muscle-building or circuit-style workout, while also providing a cardiovascular challenge.',
                          'Strength',
                          4,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          788,
                          'cb67ac90e8e317d826642341e8b89a43',
                          'Single-arm dumbbell skullcrusher',
                          'The single-arm dumbbell skullcrusher is a triceps exercise that has been a staple of bodybuilders for decades. Skullcrushers are usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or arms-focused workout.',
                          'Strength',
                          4,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          789,
                          'd797729ebb1c23e4944cd347cec3fff1',
                          'Dumbbells-together incline bench press',
                          'The dumbbells-together incline bench press is an exercise targeting the pectoral muscles, particularly the upper pecs. Squeezing the dumbbells together forces the chest muscles to work hard during the entire press. This press variation is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or chest-focused training.',
                          'Strength',
                          4,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          790,
                          '89e4cd8b93f98727a98088b02f45ad44',
                          'Incline dumbbell overhead triceps extension',
                          'The incline dumbbell overhead triceps extension is a popular exercise targeting the triceps muscles. The incline angle helps to target the long head of the triceps in particular. This exercise is usually performed for moderate to high reps as part of an upper-body or arm-focused workout.',
                          'Strength',
                          4,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          791,
                          '72fb81cf57659656f9eaa8e5606baaac',
                          'Rolling triceps press',
                          'The rolling triceps press is a dynamic triceps exercise that is popular as a bench press accessory movement among powerlifters. It can be done in traditional muscle-building rep ranges, such as 8-12 reps per set, or for very high reps of 50-100 reps per set to boost triceps size and strength. It can be performed on a bench or on the floor if a bench is unavailable.',
                          'Strength',
                          4,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          792,
                          '2719aa6b07860a49ccf9fccab612868f',
                          'Dumbbell saw triceps skullcrusher',
                          'The dumbbell saw triceps skullcrusher is a variation of the classic skullcrusher triceps exercise that has been a staple of bodybuilders for decades. It combines a dumbbell skullcrusher with a dumbbell shoulder press. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          4,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          793,
                          'c4f2436b039b92dd43a3eeecb2d749fe',
                          'Body Triceps Press Using Flat Bench',
                          'The bodyweight triceps press is an arm movement that involves performing overhead presses in a face-down position on a Smith machine or other raised bar. It is a surprisingly difficult movement that hammers all three heads of the triceps and can easily be scaled upward or downward in difficulty by moving the bar.',
                          'Strength',
                          5,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          794,
                          '06473cdb0066dd8004bb03329095ea41',
                          'Seated triceps push-down',
                          'The seated triceps push-down is a triceps exercise that is performed with a rope attachment. The seated position helps eliminate the use of momentum. It is usually performed for moderate to high reps as part of the arm-focused portion of a workout.',
                          'Strength',
                          5,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          795,
                          'f8dda9b7b44ca1df0b9791f1f97893a2',
                          'Machine triceps extension-',
                          'The machine triceps extension is a popular exercise to build size and strength in the triceps muscles. It approximates the motion of a free-weight skullcrusher, but uses a selectorized weight-stack or plate-loaded machine. Machine triceps extensions are often done for moderate to high reps, such as 8-12 reps per set or more, as part of the upper-body or arm-focused portion of a workout.',
                          'Strength',
                          5,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          796,
                          '24aa95fd3301f5176477a75761220e64',
                          'Cable V-bar push-down',
                          'The cable V-bar push-down is a popular gym exercise for targeting the triceps. It utilizes an angled bar, which can allow you to move heavier weights more comfortably than a straight bar or rope. It is usually performed for moderate to high reps, such as 8-12 reps or more per set, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          797,
                          'e783f1dc2fc2c36a46976ea76b6c201d',
                          'Reverse Grip Triceps Pushdown',
                          'The reverse-grip cable straight-bar push-down is a twist on the popular cable straight-bar push-down. The difference has to do with how the hands are positioned holding the bar: the palms facing up rather than down. Because grip will be a limiting factor, this movement is usually performed for moderate to high reps, such as 8-12 reps per set or higher.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          798,
                          'c8445bb77b206ed9c545b32bf184f95d',
                          'Kneeling cable triceps extension',
                          'The kneeling cable triceps extension is a single-joint exercise meant to isolate the triceps muscles using a high pully on a cable stack and a bench. It can also be performed in a tall-kneeling stance from a low pully. It is most commonly used in muscle-building triceps or arm workouts.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          799,
                          'befe6164ed9d2cb79748f2d5d935958f',
                          'Single-arm cable triceps extension',
                          'The single-arm cable triceps extension is a single-joint isolation exercise for building the triceps. It involves driving a handle attached to a cable stack overhead to full extension. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          800,
                          '4a6ebc654fa306843cd1bdb771a4e6ec',
                          'Dip Machine',
                          'The dip machine is a machine exercise that mimics a triceps dip, a bodyweight exercise performed on parallel bars or on a pull-up and dip station. It targets the triceps first, but also stretches and strengthens the chest and shoulders. Dips with a triceps focus are usually performed with an upright torso, the knees bent and crossed, and the arms close to the body. Dips can be performed for low reps for strength or higher reps for muscle growth.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          802,
                          '23450b9f325fc4aa16cc6f9028bd7a39',
                          'Low cable overhead triceps extension',
                          'The low cable overhead triceps extension is a single-joint isolation exercise for building the triceps. It involves lying on a bench and then driving the rope handle to full extension. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          803,
                          'e1bab5e2885bebc6b9f58213d3e08324',
                          'Lying cable triceps extension',
                          'The lying cable triceps extension is an isolation exercise performed lying on either a bench or the floor. This movement is usually performed for moderate to high reps for a burn and pump as part of an arm-focused workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          804,
                          '5b5f884845555ea70511aa87ed1d969d',
                          'Cable overhead triceps extension',
                          'The cable overhead triceps extension is a cable exercise performed in a seated position, targeting the triceps muscles. While it hits all three heads of the triceps, the overhead position helps to target the long head in particular. The seated position helps eliminate the use of momentum. It is usually performed for moderate to high reps as part of the arm-focused portion of a workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          805,
                          '9dce84d6f199382cc2478c6a2bb4fb30',
                          'Single-arm low cable triceps extension',
                          'The single-arm low cable triceps extension is a single-joint isolation exercise for building the triceps. It involves driving a handle attached to a cable stack overhead to full extension. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          806,
                          '6ae9efb2fb7e6064acbfec01e9ecffe2',
                          'Incline cable straight-bar triceps extension',
                          'The incline cable straight-bar triceps extension is a single-joint arm exercise performed on an incline bench. This incline position offers a great stretch and range of motion, potentially targeting the long head of the triceps more than some other triceps exercises. It is usually performed for moderate to high reps as part of the arm-focused portion of a workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          807,
                          '425a3ee84145b30082c0e219240fed28',
                          'Single-arm cable triceps kick-back',
                          'The single-arm cable triceps kick-back is an isolation exercise that targets the triceps. This is a common burnout move performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          808,
                          'd65db27ab271d1f170b858eb721d8fa5',
                          'Incline cable rope triceps extension',
                          'The incline cable rope triceps extension is a single-joint arm exercise performed on an incline bench. This incline position offers a great stretch and range of motion, potentially targeting the long head of the triceps more than some other triceps exercises. It is usually performed for moderate to high reps as part of the arm-focused portion of a workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          810,
                          '89e358b27297516aec46ef622c5e2125',
                          'Single-arm incline triceps extension',
                          'The single-arm incline triceps extension is a dumbbell exercise targeting the triceps. The incline angle helps to target the long head of the triceps in particular. This exercise is usually performed for moderate to high reps as part of an upper-body or arm-focused workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          811,
                          '21a64936981773493235849c11cadf08',
                          'Cable rope push-down',
                          'The cable rope push-down is a popular exercise targeting the triceps muscles. It''s easy to learn and perform, making it a favorite for everyone from beginners to advanced lifters. It is usually performed for moderate to high reps, such as 8-12 reps or more per set, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          812,
                          '684e4ed5aac21fd4818b03285749650c',
                          'Cable straight-bar push-down',
                          'The cable straight-bar push-down is a popular gym exercise for targeting the triceps. It is usually performed for moderate to high reps, such as 8-12 reps or more per set, as part of an upper-body or arm-focused workout.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          813,
                          '6688b40947c538c440f2c5f480c67866',
                          'Straight-arm bar pull-down',
                          'The straight-arm bar pull-down is a variation of the straight-arm lat pull-down performed using a cable stack machine. It can either be performed in an athletic upright stance, or slightly bent over. It both stretches and contracts the muscles of the lats (latissimus dorsi) as well as providing additional activation to the other upper back muscles and the core. Because the triceps are also isometrically involved in the movement, it is usually performed for higher reps, such as 8-15 reps or more.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          814,
                          '1df6d8440dc843e70fce78192919c4cf',
                          'Rope overhead triceps extension',
                          'The rope overhead triceps extension is a single-joint exercise focused on the triceps that uses a cable stack with a rope handle. The overhead position targets the long head of the triceps in particular. Many lifters save this move for last in their triceps workout, performing it for moderate to high reps, such as 8-12 reps or more per set.',
                          'Strength',
                          6,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          815,
                          '7fa5ae06a0ae25c64d7cdc6789fb1cef',
                          'Machine Triceps Extension',
                          'The machine triceps extension is an isolation exercise targeting the tricep muscles.',
                          'Strength',
                          7,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          816,
                          'b2f66bb9e69cb4ba340a2241a5fef526',
                          'Smith machine end-grip shoulder press',
                          'The Smith machine end-grip shoulder press is a machine-based exercise targeting the shoulder muscles. It is performed holding the end of the bar in the Smith machine on the outside of the rack. It is usually performed for moderate to high reps, such as 8-12 reps per set or more, as part of an upper-body or shoulder-focused workout.',
                          'Strength',
                          7,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          817,
                          '71327f1cc2f4982bf428172343142743',
                          'Assist machine triceps push-down',
                          'The assist machine triceps push-down is a triceps-focused exercise that is performed on an assisted pull-up or dip station. It is performed by pressing downward on the knee pad of the machine, against the resistance of the weight. It approximates the motion of a triceps cable rope push-down, but with open hands. This variation is often performed for moderate to high reps, such as 8-12 reps per set or more, as part of upper-body or arm-focused training.',
                          'Strength',
                          7,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          819,
                          '65052d3a662d752a66f5d0138d33c78f',
                          'Triceps dip',
                          'The triceps dip is a bodyweight exercise performed on parallel bars or on a pull-up and dip station. It targets the triceps first, but also stretches and strengthens the chest and shoulders. Dips with a triceps focus are usually performed with an upright torso, the knees bent and crossed, and the arms close to the body. Dips can be performed for low reps for strength or higher reps for muscle growth.',
                          'Strength',
                          8,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          820,
                          'fa5e3dc8fe2cc5bf08f1063021a7316b',
                          'Weighted bench dip',
                          'The weighted bench dip is a highly effective exercise for building the triceps. The resistance comes from a combination of body weight and added weight—usually a weight plate.',
                          'Strength',
                          8,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          823,
                          '0f73ecd19174adad70cb8230ee8a8121',
                          'Ring dip',
                          'The ring dip is an upper-body strength exercise performed on gymnastic rings. It targets the muscles of the chest, triceps, and shoulders, but is also quite taxing to the core. It is generally considered to be more difficult than dips performed on parallel bars. It is common in gymnastics training and CrossFit workouts, but is also a simple way to make dips more challenging for any strength athlete.',
                          'Strength',
                          8,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          824,
                          '3518b1d64616228bfcc286a07d364548',
                          'Feet-elevated bench dip',
                          'The feet-elevated bench dip is a popular bodyweight exercise for building the triceps, chest, and shoulders. Elevating the feet brings more chest and shoulder into the movement, but also allows for extra weight on the hips. If these bother your shoulders, try performing them between two benches or chairs rather than on a single bench.',
                          'Strength',
                          8,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          825,
                          '7039f9014b55b138b36f8409398e82f3',
                          'Bodyweight triceps press',
                          'The bodyweight triceps press is an arm movement that involves performing overhead presses in a face-down position on a Smith machine or other raised bar. It is a surprisingly difficult movement that hammers all three heads of the triceps and the difficulty can easily be scaled up or down by moving the bar.',
                          'Strength',
                          8,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          826,
                          'f7848fc227fb5bc03c9d29a5acdb51dd',
                          'Russian Bar Dip',
                          'The Russian dip is a chest-and-triceps building exercise that resembles the chest dip, albeit with a twist that makes it even harder and more taxing.',
                          'Strength',
                          8,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          827,
                          'ae14124724a570af4a5ec0c16f85bbe1',
                          'Straight-arm plank with kick-back',
                          'The straight-arm plank with kick-back is a hybrid movement that trains the abdominal and triceps muscles simultaneously. It can address multiple muscle groups in a time-efficient muscle-building or circuit-style workout, while also providing an additional cardiovascular challenge.',
                          'Strength',
                          8,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          828,
                          'e9600a908433f57379615e45108b3719',
                          'Banded dip',
                          'The banded dip is a bodyweight exercise targeting the chest, triceps, and shoulders. This variation utilizes an exercise band to help support the lifter in the bottom part of the movement. This makes pushing out of the hole easier, and may combat the shoulder pain that some lifters feel when they perform dips. The top of the movement receives less help from the band, putting more stress on the triceps.',
                          'Strength',
                          8,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          829,
                          '75d72c4c1796e92f92b4d121c3e65664',
                          'Bench dip',
                          'The bench dip is a highly effective exercise for building the triceps. The resistance comes from the body itself, rather than added weight.',
                          'Strength',
                          8,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          830,
                          '4dc32bf99a3c38d44f99a8f36fe648a3',
                          'Decline EZ-bar skullcrusher',
                          'The decline EZ-bar skullcrusher is a popular exercise targeting the triceps muscles. The angle of the bench creates a greater range of motion than flat bench skullcrushers, as well as targeting the lateral head of the muscle. This exercise is usually performed for moderate to high reps as part of an upper-body or arm-focused workout.',
                          'Strength',
                          12,
                          16,
                          1
                      );

INSERT INTO exercises (
                          id,
                          key,
                          name,
                          description,
                          type,
                          equipment_id,
                          muscle_id,
                          level_id
                      )
                      VALUES (
                          831,
                          '5164cdebc4c60640c5268834be2ace73',
                          'EZ-Bar Skullcrusher',
                          'The EZ-bar skullcrusher is a popular exercise targeting the triceps muscles. Contrary to what the name implies, the bar should actually come down behind the head. It is usually performed for moderate to high reps as part of an upper-body or arms-focused workout.',
                          'Strength',
                          12,
                          16,
                          1
                      );

-- Table: workout_exercises
DROP TABLE IF EXISTS workout_exercises;

CREATE TABLE IF NOT EXISTS workout_exercises (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    workout_id  INTEGER REFERENCES workouts (id) ON DELETE CASCADE
                        NOT NULL,
    exercise_id INTEGER REFERENCES exercises (id) ON DELETE RESTRICT,
    sets        INTEGER NOT NULL,
    reps        INTEGER,
    weight      REAL,
    position    REAL    NOT NULL
                        DEFAULT (0) 
);


-- Table: workout_history
DROP TABLE IF EXISTS workout_history;

CREATE TABLE IF NOT EXISTS workout_history (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    workout_id         REFERENCES workouts (id) ON DELETE SET NULL,
    start_time NUMERIC NOT NULL
                       DEFAULT (CURRENT_TIMESTAMP),
    end_time   NUMERIC
);


-- Table: workout_history_sets
DROP TABLE IF EXISTS workout_history_sets;

CREATE TABLE IF NOT EXISTS workout_history_sets (
    id                 INTEGER PRIMARY KEY AUTOINCREMENT,
    exercise_id        INTEGER REFERENCES exercises (id) 
                               NOT NULL,
    workout_history_id INTEGER REFERENCES workout_history (id) 
                               NOT NULL,
    reps               INTEGER NOT NULL,
    weight             REAL,
    is_complete        NUMERIC NOT NULL
                               DEFAULT (0) 
);


-- Table: workouts
DROP TABLE IF EXISTS workouts;

CREATE TABLE IF NOT EXISTS workouts (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT    NOT NULL
);


-- Trigger: workout_exercises_deleted
DROP TRIGGER IF EXISTS workout_exercises_deleted;
CREATE TRIGGER IF NOT EXISTS workout_exercises_deleted
                       AFTER DELETE
                          ON workout_exercises
BEGIN
    UPDATE workout_exercises
       SET position = (position - 1) 
     WHERE position > OLD.position;
END;


-- Trigger: workout_exercises_inserted
DROP TRIGGER IF EXISTS workout_exercises_inserted;
CREATE TRIGGER IF NOT EXISTS workout_exercises_inserted
                       AFTER INSERT
                          ON workout_exercises
                    FOR EACH ROW
BEGIN
    UPDATE workout_exercises
       SET position = (
               SELECT COUNT( * ) 
                FROM workout_exercises we
                WHERE we.workout_id = NEW.workout_id
                GROUP BY we.workout_id
           )
     WHERE id = NEW.id;
END;

DROP TABLE IF EXISTS muscle_groups;
