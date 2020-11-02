{
  "version": "1.2",
  "package": {
    "name": "MULT LOGIC",
    "version": "1.5",
    "description": "",
    "author": "UNIKE",
    "image": ""
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
        {
          "id": "ae2d562c-573c-486d-a216-de0fea933b7b",
          "type": "basic.input",
          "data": {
            "name": "V",
            "range": "[5:0]",
            "pins": [
              {
                "index": "5",
                "name": "",
                "value": ""
              },
              {
                "index": "4",
                "name": "",
                "value": ""
              },
              {
                "index": "3",
                "name": "",
                "value": ""
              },
              {
                "index": "2",
                "name": "",
                "value": ""
              },
              {
                "index": "1",
                "name": "",
                "value": ""
              },
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -256,
            "y": 16
          }
        },
        {
          "id": "f9f689ee-ff5c-4cce-a107-77a413ea9187",
          "type": "basic.output",
          "data": {
            "name": "P",
            "range": "[11:0]",
            "pins": [
              {
                "index": "11",
                "name": "",
                "value": ""
              },
              {
                "index": "10",
                "name": "",
                "value": ""
              },
              {
                "index": "9",
                "name": "",
                "value": ""
              },
              {
                "index": "8",
                "name": "",
                "value": ""
              },
              {
                "index": "7",
                "name": "",
                "value": ""
              },
              {
                "index": "6",
                "name": "",
                "value": ""
              },
              {
                "index": "5",
                "name": "",
                "value": ""
              },
              {
                "index": "4",
                "name": "",
                "value": ""
              },
              {
                "index": "3",
                "name": "",
                "value": ""
              },
              {
                "index": "2",
                "name": "",
                "value": ""
              },
              {
                "index": "1",
                "name": "",
                "value": ""
              },
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 1888,
            "y": 224
          }
        },
        {
          "id": "a0114bf7-e382-43ac-85f3-07e4477eac9e",
          "type": "basic.input",
          "data": {
            "name": "I",
            "range": "[5:0]",
            "pins": [
              {
                "index": "5",
                "name": "",
                "value": ""
              },
              {
                "index": "4",
                "name": "",
                "value": ""
              },
              {
                "index": "3",
                "name": "",
                "value": ""
              },
              {
                "index": "2",
                "name": "",
                "value": ""
              },
              {
                "index": "1",
                "name": "",
                "value": ""
              },
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -264,
            "y": 432
          }
        },
        {
          "id": "e44ce327-a338-421b-b591-e7dd15df9fc8",
          "type": "basic.code",
          "data": {
            "code": "//MULT LOGIC\n\n\n// SE REALIZAN LAS PRIMERAS 36 OPERACIONES AND, SE CALCULAN LOS CARRYS SEGUN LAS 19 FUNCIONES LOGICAS OBTENIDAS A PARTIR DE LAS 10 TABLAS DE VERDAD CORRESPONDIENTES Y SE OBTIENE EL RESULTADO DE POTENCINCIA APLICANDO LAS 12 OPERACIONES XOR \n\nwire A0,A1,A2,A3,A4,A5,B0,B1,B2,B3,B4,B5,C0,C1,C2,C3,C4,C5,D0,D1,D2,D3,D4,D5,E0,E1,E2,E3,E4,E5,F0,F1,F2,F3,F4,F5;\nwire KU1,KU2,KU3,KU4,KU5,KU6,KU7,KU8,KU9,KU10,KV2,KV3,KV4,KV5,KV6,KV7,KV8,KV9,KW5;\n\nassign A0 = V[0] & I[0]; assign A1 = V[1] & I[0]; assign A2 = V[2] & I[0]; assign A3 = V[3] & I[0]; assign A4 = V[4] & I[0]; assign A5 = V[5] & I[0];\nassign B0 = V[0] & I[1]; assign B1 = V[1] & I[1]; assign B2 = V[2] & I[1]; assign B3 = V[3] & I[1]; assign B4 = V[4] & I[1]; assign B5 = V[5] & I[1];\nassign C0 = V[0] & I[2]; assign C1 = V[1] & I[2]; assign C2 = V[2] & I[2]; assign C3 = V[3] & I[2]; assign C4 = V[4] & I[2]; assign C5 = V[5] & I[2];\nassign D0 = V[0] & I[3]; assign D1 = V[1] & I[3]; assign D2 = V[2] & I[3]; assign D3 = V[3] & I[3]; assign D4 = V[4] & I[3]; assign D5 = V[5] & I[3];\nassign E0 = V[0] & I[4]; assign E1 = V[1] & I[4]; assign E2 = V[2] & I[4]; assign E3 = V[3] & I[4]; assign E4 = V[4] & I[4]; assign E5 = V[5] & I[4];\nassign F0 = V[0] & I[5]; assign F1 = V[1] & I[5]; assign F2 = V[2] & I[5]; assign F3 = V[3] & I[5]; assign F4 = V[4] & I[5]; assign F5 = V[5] & I[5];\n\nassign KU1 = A1 & B0; assign KU2 = ~A2&C0&KU1 | ~A2&B1&KU1 | ~A2&B1&C0 | A2&~B1&KU1 | A2&~B1&C0 | A2&B1&~C0 | A2&B1&~KU1; assign KV2 = A2&B1&C0&KU1; assign KU3 = ~A3&~B2&D0&KU2 | ~A3&~B2&C1&KU2 | ~A3&~B2&C1&D0 | ~A3&B2&~C1&KU2 | ~A3&B2&~C1&D0 | ~A3&B2&C1&~D0 \n| ~A3&B2&C1&~KU2 | A3&~B2&~C1&KU2 | A3&~B2&~C1&D0 | A3&~B2&C1&~D0 | A3&~B2&C1&~KU2 | A3&B2&~C1&~D0 | A3&B2&~C1&~KU2 | A3&B2&~D0&~KU2; assign KV3 = B2&C1&D0&KU2 | A3&C1&D0&KU2 | A3&B2&D0&KU2 | A3&B2&C1&KU2 | A3&B2&C1&D0;\nassign KU4 = ~A4&~B3&~C2&~D1&KV2&KU3 | ~A4&~B3&~C2&~D1&E0&KU3 | ~A4&~B3&~C2&~D1&E0&KV2 | ~A4&~B3&~C2&D1&~E0&KU3 | ~A4&~B3&~C2&D1&~E0&KV2 | ~A4&~B3&~C2&D1&E0&~KV2 | ~A4&~B3&~C2&D1&E0&~KU3 | ~A4&~B3&C2&~D1&~E0&KU3 | ~A4&~B3&C2&~D1&~E0&KV2 | ~A4&~B3&C2&~D1&E0&~KV2\n| ~A4&~B3&C2&~D1&E0&~KU3 | ~A4&~B3&C2&D1&~E0&~KV2 | ~A4&~B3&C2&D1&~E0&~KU3 | ~A4&~B3&C2&D1&~KV2&~KU3 | ~A4&B3&~C2&~D1&~E0&KU3 | ~A4&B3&~C2&~D1&~E0&KV2 | ~A4&B3&~C2&~D1&E0&~KV2 | ~A4&B3&~C2&~D1&E0&~KU3 | ~A4&B3&~C2&D1&~E0&~KV2 | ~A4&B3&~C2&D1&~E0&~KU3 | ~A4&B3 \n&~C2&D1&~KV2&~KU3 | ~A4&B3&C2&~D1&~E0&~KV2 | ~A4&B3&C2&~D1&~E0&~KU3 | ~A4&B3&C2&~D1&~KV2&~KU3 | ~A4&B3&C2&~E0&~KV2&~KU3 | B3&C2&D1&E0&KV2&KU3 | A4&~B3&~C2&~D1&~E0&KU3 | A4&~B3&~C2&~D1&~E0&KV2 | A4&~B3&~C2&~D1&E0&~KV2 | A4&~B3&~C2&~D1&E0&~KU3 | A4&~B3&~C2&D1 \n&~E0&~KV2 | A4&~B3&~C2&D1&~E0&~KU3 | A4&~B3&~C2&D1&~KV2&~KU3 | A4&~B3&C2&~D1&~E0&~KV2 | A4&~B3&C2&~D1&~E0&~KU3 | A4&~B3&C2&~D1&~KV2&~KU3 | A4&~B3&C2&~E0&~KV2&~KU3 | A4&C2&D1&E0&KV2&KU3 | A4&B3&~C2&~D1&~E0&~KV2 | A4&B3&~C2&~D1&~E0&~KU3 | A4&B3&~C2&~D1&~KV2&~KU3 \n| A4&B3&~C2&~E0&~KV2&~KU3 | A4&B3&~D1&~E0&~KV2&~KU3 | A4&B3&D1&E0&KV2&KU3 | A4&B3&C2&E0&KV2&KU3 | A4&B3&C2&D1&KV2&KU3 | A4&B3&C2&D1&E0&KU3 | A4&B3&C2&D1&E0&KV2; assign KV4 = D1&E0&KV2&KU3 | C2&E0&KV2&KU3 | C2&D1&KV2&KU3 | C2&D1&E0&KU3 | C2&D1&E0&KV2 | B3&E0 \n&KV2&KU3 | B3&D1&KV2&KU3 | B3&D1&E0&KU3 | B3&D1&E0&KV2 | B3&C2&KV2&KU3 | B3&C2&E0&KU3 | B3&C2&E0&KV2 | B3&C2&D1&KU3 | B3&C2&D1&KV2 | B3&C2&D1&E0 | A4&E0&KV2&KU3 | A4&D1&KV2&KU3 | A4&D1&E0&KU3 | A4&D1&E0&KV2 | A4&C2&KV2&KU3 | A4&C2&E0&KU3 | A4&C2&E0&KV2 | A4&C2 \n&D1&KU3 | A4&C2&D1&KV2 | A4&C2&D1&E0 | A4&B3&KV2&KU3 | A4&B3&E0&KU3 | A4&B3&E0&KV2 | A4&B3&D1&KU3 | A4&B3&D1&KV2 | A4&B3&D1&E0 | A4&B3&C2&KU3 | A4&B3&C2&KV2 | A4&B3&C2&E0 | A4&B3&C2&D1;\nassign KU5 = ~A5&~B4&~C3&~D2&~E1&KV3&KU4 | ~A5&~B4&~C3&~D2&~E1&F0&KU4 | ~A5&~B4&~C3&~D2&~E1&F0&KV3 | ~A5&~B4&~C3&~D2&E1&~F0&KU4 | ~A5&~B4&~C3&~D2&E1&~F0&KV3 | ~A5&~B4&~C3&~D2&E1&F0&~KV3 | ~A5&~B4&~C3&~D2&E1&F0&~KU4 | ~A5&~B4&~C3&D2&~E1&~F0&KU4 | ~A5&~B4&~C3&D2 \n&~E1&~F0&KV3 | ~A5&~B4&~C3&D2&~E1&F0&~KV3 | ~A5&~B4&~C3&D2&~E1&F0&~KU4 | ~A5&~B4&~C3&D2&E1&~F0&~KV3 | ~A5&~B4&~C3&D2&E1&~F0&~KU4 | ~A5&~B4&~C3&D2&E1&~KV3&~KU4 | ~A5&~B4&C3&~D2&~E1&~F0&KU4 | ~A5&~B4&C3&~D2&~E1&~F0&KV3 | ~A5&~B4&C3&~D2&~E1&F0&~KV3 | ~A5&~B4&C3&~D2 \n&~E1&F0&~KU4 | ~A5&~B4&C3&~D2&E1&~F0&~KV3 | ~A5&~B4&C3&~D2&E1&~F0&~KU4 | ~A5&~B4&C3&~D2&E1&~KV3&~KU4 | ~A5&~B4&C3&D2&~E1&~F0&~KV3 | ~A5&~B4&C3&D2&~E1&~F0&~KU4 | ~A5&~B4&C3&D2&~E1&~KV3&~KU4 | ~A5&~B4&C3&D2&~F0&~KV3&~KU4 | ~A5&C3&D2&E1&F0&KV3&KU4 | ~A5&B4&~C3&~D2 \n&~E1&~F0&KU4 | ~A5&B4&~C3&~D2&~E1&~F0&KV3 | ~A5&B4&~C3&~D2&~E1&F0&~KV3 | ~A5&B4&~C3&~D2&~E1&F0&~KU4 | ~A5&B4&~C3&~D2&E1&~F0&~KV3 | ~A5&B4&~C3&~D2&E1&~F0&~KU4 | ~A5&B4&~C3&~D2&E1&~KV3&~KU4 | ~A5&B4&~C3&D2&~E1&~F0&~KV3 | ~A5&B4&~C3&D2&~E1&~F0&~KU4 | ~A5&B4&~C3&D2\n&~E1&~KV3&~KU4 | ~A5&B4&~C3&D2&~F0&~KV3&~KU4 | ~A5&B4&D2&E1&F0&KV3&KU4 | ~A5&B4&C3&~D2&~E1&~F0&~KV3 | ~A5&B4&C3&~D2&~E1&~F0&~KU4 | ~A5&B4&C3&~D2&~E1&~KV3&~KU4 | ~A5&B4&C3&~D2&~F0&~KV3&~KU4 | ~A5&B4&C3&~E1&~F0&~KV3&~KU4 | ~A5&B4&C3&E1&F0&KV3&KU4 | ~A5&B4&C3&D2&F0\n&KV3&KU4 | ~A5&B4&C3&D2&E1&KV3&KU4 | ~A5&B4&C3&D2&E1&F0&KU4 | ~A5&B4&C3&D2&E1&F0&KV3 | A5&~B4&~C3&~D2&~E1&~F0&KU4 | A5&~B4&~C3&~D2&~E1&~F0&KV3 | A5&~B4&~C3&~D2&~E1&F0&~KV3 | A5&~B4&~C3&~D2&~E1&F0&~KU4 | A5&~B4&~C3&~D2&E1&~F0&~KV3 | A5&~B4&~C3&~D2&E1&~F0&~KU4 \n| A5&~B4&~C3&~D2&E1&~KV3&~KU4 | A5&~B4&~C3&D2&~E1&~F0&~KV3 | A5&~B4&~C3&D2&~E1&~F0&~KU4 | A5&~B4&~C3&D2&~E1&~KV3&~KU4 | A5&~B4&~C3&D2&~F0&~KV3&~KU4 | A5&~B4&D2&E1&F0&KV3&KU4 | A5&~B4&C3&~D2&~E1&~F0&~KV3 | A5&~B4&C3&~D2&~E1&~F0&~KU4 | A5&~B4&C3&~D2&~E1&~KV3&~KU4 \n| A5&~B4&C3&~D2&~F0&~KV3&~KU4 | A5&~B4&C3&~E1&~F0&~KV3&~KU4 | A5&~B4&C3&E1&F0&KV3&KU4 | A5&~B4&C3&D2&F0&KV3&KU4 | A5&~B4&C3&D2&E1&KV3&KU4 | A5&~B4&C3&D2&E1&F0&KU4 | A5&~B4&C3&D2&E1&F0&KV3 | A5&B4&~C3&~D2&~E1&~F0&~KV3 | A5&B4&~C3&~D2&~E1&~F0&~KU4 | A5&B4&~C3&~D2 \n&~E1&~KV3&~KU4 | A5&B4&~C3&~D2&~F0&~KV3&~KU4 | A5&B4&~C3&~E1&~F0&~KV3&~KU4 | A5&B4&~D2&~E1&~F0&~KV3&~KU4 | A5&B4&~C3&E1&F0&KV3&KU4 | A5&B4&~C3&D2&F0&KV3&KU4 | A5&B4&~C3&D2&E1&KV3&KU4 | A5&B4&~C3&D2&E1&F0&KU4 | A5&B4&~C3&D2&E1&F0&KV3 | A5&B4&C3&~D2&F0&KV3&KU4 \n| A5&B4&C3&~D2&E1&KV3&KU4 | A5&B4&C3&~D2&E1&F0&KU4 | A5&B4&C3&~D2&E1&F0&KV3 | A5&B4&C3&D2&~E1&KV3&KU4 | A5&B4&C3&D2&~E1&F0&KU4 | A5&B4&C3&D2&~E1&F0&KV3 | A5&B4&C3&D2&E1&~F0&KU4 | A5&B4&C3&D2&E1&~F0&KV3 | A5&B4&C3&D2&E1&F0&~KV3 | A5&B4&C3&D2&E1&F0&~KU4;\nassign KV5 = ~A5&E1&F0&KV3&KU4 | ~A5&D2&F0&KV3&KU4 | ~A5&D2&E1&KV3&KU4 | ~A5&D2&E1&F0&KU4 | ~A5&D2&E1&F0&KV3 | ~A5&C3&F0&KV3&KU4 | C3&~D2&E1&KV3&KU4 | ~A5&C3&E1&F0&KU4 | ~A5&C3&E1&F0&KV3 | ~B4&C3&D2&KV3&KU4 | ~A5&C3&D2&F0&KU4 | ~A5&C3&D2&F0&KV3 | ~A5&C3&D2&E1&KU4\n| C3&D2&E1&KV3&~KU4 | C3&D2&E1&F0&~KV3 | ~A5&B4&F0&KV3&KU4 | ~A5&B4&E1&KV3&KU4 | ~A5&B4&E1&F0&KU4 | ~A5&B4&E1&F0&KV3 | ~A5&B4&D2&KV3&KU4 | ~A5&B4&D2&F0&KU4 | B4&D2&~E1&F0&KV3 | ~A5&B4&D2&E1&KU4 | ~A5&B4&D2&E1&KV3 | ~A5&B4&D2&E1&F0 | ~A5&B4&C3&KV3&KU4 | ~A5&B4 \n&C3&F0&KU4 | ~A5&B4&C3&F0&KV3 | ~A5&B4&C3&E1&KU4 | ~A5&B4&C3&E1&KV3 | ~A5&B4&C3&E1&F0 | ~A5&B4&C3&D2&KU4 | ~A5&B4&C3&D2&KV3 | ~A5&B4&C3&D2&F0 | ~A5&B4&C3&D2&E1 | A5&~B4&F0&KV3&KU4 | A5&~B4&E1&KV3&KU4 | A5&~B4&E1&F0&KU4 | A5&E1&F0&KV3&~KU4 | A5&~C3&D2&KV3&KU4 \n| A5&~B4&D2&F0&KU4 | A5&~B4&D2&F0&KV3 | A5&~B4&D2&E1&KU4 | A5&~B4&D2&E1&KV3 | A5&~B4&D2&E1&F0 | A5&~B4&C3&KV3&KU4 | A5&~B4&C3&F0&KU4 | A5&C3&~E1&F0&KV3 | A5&~B4&C3&E1&KU4 | A5&~B4&C3&E1&KV3 | A5&~B4&C3&E1&F0 | A5&~B4&C3&D2&KU4 | A5&~B4&C3&D2&KV3 | A5&~B4&C3 \n&D2&F0 | A5&~B4&C3&D2&E1 | A5&B4&~C3&KV3&KU4 | A5&B4&~C3&F0&KU4 | A5&B4&~C3&F0&KV3 | A5&B4&~C3&E1&KU4 | A5&B4&~D2&E1&KV3 | A5&B4&E1&F0&~KV3 | A5&B4&~C3&D2&KU4 | A5&B4&~C3&D2&KV3 | A5&B4&~C3&D2&F0 | A5&B4&D2&E1&~F0 | A5&B4&C3&~D2&KU4 | A5&B4&C3&~D2&KV3 | A5&B4\n&C3&~D2&F0 | A5&B4&C3&~D2&E1 | A5&B4&C3&D2&~E1; assign KW5 = A5&B4&C3&D2&E1&F0&KV3&KU4; assign KU6 = ~B5&~C4&~D3&~E2&KV4&KU5 | ~B5&~C4&~D3&~E2&F1&KU5 | ~B5&~C4&~D3&~E2&F1&KV4 | ~B5&~C4&~D3&E2&~F1&KU5 | ~B5&~C4&~D3&E2&~F1&KV4 | ~B5&~C4&~D3&E2&F1&~KV4 | ~B5&~C4&~D3 \n&E2&F1&~KU5 | ~B5&~C4&D3&~E2&~F1&KU5 | ~B5&~C4&D3&~E2&~F1&KV4 | ~B5&~C4&D3&~E2&F1&~KV4 | ~B5&~C4&D3&~E2&F1&~KU5 | ~B5&~C4&D3&E2&~F1&~KV4 | ~B5&~C4&D3&E2&~F1&~KU5 | ~B5&~C4&D3&E2&~KV4&~KU5 | ~B5&C4&~D3&~E2&~F1&KU5 | ~B5&C4&~D3&~E2&~F1&KV4 | ~B5&C4&~D3&~E2&F1&~KV4 \n| ~B5&C4&~D3&~E2&F1&~KU5 | ~B5&C4&~D3&E2&~F1&~KV4 | ~B5&C4&~D3&E2&~F1&~KU5 | ~B5&C4&~D3&E2&~KV4&~KU5 | ~B5&C4&D3&~E2&~F1&~KV4 | ~B5&C4&D3&~E2&~F1&~KU5 | ~B5&C4&D3&~E2&~KV4&~KU5 | ~B5&C4&D3&~F1&~KV4&~KU5 | C4&D3&E2&F1&KV4&KU5 | B5&~C4&~D3&~E2&~F1&KU5 | B5&~C4&~D3\n&~E2&~F1&KV4 | B5&~C4&~D3&~E2&F1&~KV4 | B5&~C4&~D3&~E2&F1&~KU5 | B5&~C4&~D3&E2&~F1&~KV4 | B5&~C4&~D3&E2&~F1&~KU5 | B5&~C4&~D3&E2&~KV4&~KU5 | B5&~C4&D3&~E2&~F1&~KV4 | B5&~C4&D3&~E2&~F1&~KU5 | B5&~C4&D3&~E2&~KV4&~KU5 | B5&~C4&D3&~F1&~KV4&~KU5 | B5&D3&E2&F1&KV4&KU5 \n| B5&C4&~D3&~E2&~F1&~KV4 | B5&C4&~D3&~E2&~F1&~KU5 | B5&C4&~D3&~E2&~KV4&~KU5 | B5&C4&~D3&~F1&~KV4&~KU5 | B5&C4&~E2&~F1&~KV4&~KU5 | B5&C4&E2&F1&KV4&KU5 | B5&C4&D3&F1&KV4&KU5 | B5&C4&D3&E2&KV4&KU5 | B5&C4&D3&E2&F1&KU5 | B5&C4&D3&E2&F1&KV4;\nassign KV6 = E2&F1&KV4&KU5 | D3&F1&KV4&KU5 | D3&E2&KV4&KU5 | D3&E2&F1&KU5 | D3&E2&F1&KV4 | C4&F1&KV4&KU5 | C4&E2&KV4&KU5 | C4&E2&F1&KU5 | C4&E2&F1&KV4 | C4&D3&KV4&KU5 | C4&D3&F1&KU5 | C4&D3&F1&KV4 | C4&D3&E2&KU5 | C4&D3&E2&KV4 | C4&D3&E2&F1 | B5&F1&KV4&KU5 | B5&E2 \n&KV4&KU5 | B5&E2&F1&KU5 | B5&E2&F1&KV4 | B5&D3&KV4&KU5 | B5&D3&F1&KU5 | B5&D3&F1&KV4 | B5&D3&E2&KU5 | B5&D3&E2&KV4 | B5&D3&E2&F1 | B5&C4&KV4&KU5 | B5&C4&F1&KU5 | B5&C4&F1&KV4 | B5&C4&E2&KU5 | B5&C4&E2&KV4 | B5&C4&E2&F1 | B5&C4&D3&KU5 | B5&C4&D3&KV4 | B5&C4&D3&F1\n| B5&C4&D3&E2; assign KU7 = ~C5&~D4&~E3&KV5&KU6 | ~C5&~D4&~E3&F2&KU6 | ~C5&~D4&~E3&F2&KV5 | ~C5&~D4&E3&~F2&KU6 | ~C5&~D4&E3&~F2&KV5 | ~C5&~D4&E3&F2&~KV5 | ~C5&~D4&E3&F2&~KU6 | ~C5&D4&~E3&~F2&KU6 | ~C5&D4&~E3&~F2&KV5 | ~C5&D4&~E3&F2&~KV5 | ~C5&D4&~E3&F2&~KU6 \n| ~C5&D4&E3&~F2&~KV5 | ~C5&D4&E3&~F2&~KU6 | ~C5&D4&E3&~KV5&~KU6 | C5&~D4&~E3&~F2&KU6 | C5&~D4&~E3&~F2&KV5 | C5&~D4&~E3&F2&~KV5 | C5&~D4&~E3&F2&~KU6 | C5&~D4&E3&~F2&~KV5 | C5&~D4&E3&~F2&~KU6 | C5&~D4&E3&~KV5&~KU6 | C5&D4&~E3&~F2&~KV5 | C5&D4&~E3&~F2&~KU6 | C5&D4 \n&~E3&~KV5&~KU6 | C5&D4&~F2&~KV5&~KU6 | C5&D4&E3&F2&KV5&KU6; assign KV7 = E3&F2&KV5&KU6 | D4&F2&KV5&KU6 | D4&E3&KV5&KU6 | D4&E3&F2&KU6 | D4&E3&F2&KV5 | C5&F2&KV5&KU6 | C5&E3&KV5&KU6 | C5&E3&F2&KU6 | C5&E3&F2&KV5 | C5&D4&KV5&KU6 | C5&D4&F2&KU6 | C5&D4&F2&KV5 \n| C5&D4&E3&KU6 | C5&D4&E3&KV5 | C5&D4&E3&F2; assign KU8 = ~D5&~E4&~F3&KV6&KU7 | ~D5&~E4&~F3&KW5&KU7 | ~D5&~E4&~F3&KW5&KV6 | ~D5&~E4&F3&~KW5&KU7 | ~D5&~E4&F3&~KW5&KV6 | ~D5&~E4&F3&KW5&~KV6 | ~D5&~E4&F3&KW5&~KU7 | ~D5&E4&~F3&~KW5&KU7 | ~D5&E4&~F3&~KW5&KV6 | ~D5&E4 \n&~F3&KW5&~KV6 | ~D5&E4&~F3&KW5&~KU7 | ~D5&E4&F3&~KW5&~KV6 | ~D5&E4&F3&~KW5&~KU7 | ~D5&E4&F3&~KV6&~KU7 | D5&~E4&~F3&~KW5&KU7 | D5&~E4&~F3&~KW5&KV6 | D5&~E4&~F3&KW5&~KV6 | D5&~E4&~F3&KW5&~KU7 | D5&~E4&F3&~KW5&~KV6 | D5&~E4&F3&~KW5&~KU7 | D5&~E4&F3&~KV6&~KU7 | D5&E4 \n&~F3&~KW5&~KV6 | D5&E4&~F3&~KW5&~KU7 | D5&E4&~F3&~KV6&~KU7 | D5&E4&~KW5&~KV6&~KU7 | D5&E4&F3&KW5&KV6&KU7; assign KV8 = F3&KW5&KV6&KU7 | E4&KW5&KV6&KU7 | E4&F3&KV6&KU7 | E4&F3&KW5&KU7 | E4&F3&KW5&KV6 | D5&KW5&KV6&KU7 | D5&F3&KV6&KU7 | D5&F3&KW5&KU7 | D5&F3&KW5&KV6 \n| D5&E4&KV6&KU7 | D5&E4&KW5&KU7 | D5&E4&KW5&KV6 | D5&E4&F3&KU7 | D5&E4&F3&KV6 | D5&E4&F3&KW5; assign KU9 = ~E5&KV7&KU8 | ~E5&F4&KU8 | ~E5&F4&KV7 | E5&~F4&KU8 | E5&~F4&KV7 | E5&F4&~KV7 | E5&F4&~KU8; assign KV9 = E5&F4&KV7&KU8; assign KU10 = KV8&KU9 | F5&KU9 | F5&KV8;\n\nassign P[0] = A0; assign P[1] = A1 ^ B0; assign P[2] = A2 ^ B1 ^ C0 ^ KU1; assign P[3] = A3 ^ B2 ^ C1 ^ D0 ^ KU2; assign P[4] = A4 ^ B3 ^ C2 ^ D1 ^ E0 ^ KV2 ^ KU3; assign P[5] = A5 ^ B4 ^ C3 ^ D2 ^ E1 ^ F0 ^ KV3 ^ KU4; \nassign P[6] = B5 ^ C4 ^ D3 ^ E2 ^ F1 ^ KV4 ^ KU5; assign P[7] = C5 ^ D4 ^ E3 ^ F2 ^ KV5 ^ KU6; assign P[8] = D5 ^ E4 ^ F3 ^ KW5 ^ KV6 ^ KU7; assign P[9] = E5 ^ F4 ^ KV7 ^ KU8; assign P[10] = F5 ^ KV8 ^ KU9; assign P[11] = KV9 ^ KU10;  ",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "V",
                  "range": "[5:0]",
                  "size": 6
                },
                {
                  "name": "I",
                  "range": "[5:0]",
                  "size": 6
                }
              ],
              "out": [
                {
                  "name": "P",
                  "range": "[11:0]",
                  "size": 12
                }
              ]
            }
          },
          "position": {
            "x": -96,
            "y": -160
          },
          "size": {
            "width": 1928,
            "height": 832
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "ae2d562c-573c-486d-a216-de0fea933b7b",
            "port": "out"
          },
          "target": {
            "block": "e44ce327-a338-421b-b591-e7dd15df9fc8",
            "port": "V"
          },
          "size": 6
        },
        {
          "source": {
            "block": "a0114bf7-e382-43ac-85f3-07e4477eac9e",
            "port": "out"
          },
          "target": {
            "block": "e44ce327-a338-421b-b591-e7dd15df9fc8",
            "port": "I"
          },
          "size": 6
        },
        {
          "source": {
            "block": "e44ce327-a338-421b-b591-e7dd15df9fc8",
            "port": "P"
          },
          "target": {
            "block": "f9f689ee-ff5c-4cce-a107-77a413ea9187",
            "port": "in"
          },
          "size": 12
        }
      ]
    }
  },
  "dependencies": {}
}