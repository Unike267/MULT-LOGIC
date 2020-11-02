{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
        {
          "id": "010f3940-42a5-47ae-a0d7-41f95fd99102",
          "type": "basic.output",
          "data": {
            "name": "ERR",
            "range": "[1:0]",
            "pins": [
              {
                "index": "1",
                "name": "LED1",
                "value": "44"
              },
              {
                "index": "0",
                "name": "LED0",
                "value": "45"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 3128,
            "y": 544
          }
        },
        {
          "id": "5eaef775-2454-4ac4-b2e6-7fd1ab75c676",
          "type": "basic.input",
          "data": {
            "name": "CLK",
            "pins": [
              {
                "index": "0",
                "name": "CLK",
                "value": "49"
              }
            ],
            "virtual": false,
            "clock": true
          },
          "position": {
            "x": 824,
            "y": 632
          }
        },
        {
          "id": "a1457931-3fce-402e-a42e-44a5ee83153d",
          "type": "basic.output",
          "data": {
            "name": "I",
            "range": "[5:0]",
            "pins": [
              {
                "index": "5",
                "name": "LED7",
                "value": "37"
              },
              {
                "index": "4",
                "name": "LED6",
                "value": "38"
              },
              {
                "index": "3",
                "name": "LED5",
                "value": "39"
              },
              {
                "index": "2",
                "name": "LED4",
                "value": "41"
              },
              {
                "index": "1",
                "name": "LED3",
                "value": "42"
              },
              {
                "index": "0",
                "name": "LED2",
                "value": "43"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1840,
            "y": 840
          }
        },
        {
          "id": "664ab7a0-d991-4200-ace3-0d76ef1fac7a",
          "type": "basic.code",
          "data": {
            "code": "/*\n    Cuando se halla contado hasta 120k (nº de 17 bits) habrá pasado 0,01 \n    segundos es decir CNT1 aumenta a frecuencia de 100 Hz.\n    Antes de que CNT1 se reinicie por overflow se aumenta CNT2 a frecuencia \n    de 100/64 = 1,5625 Hz. Para que el multiplicador recorra todos los números \n    pasarán 1/1,5625 * 64 = 40,96 segundos.\n*/\n\nreg [16:0] RED;\nreg [5:0] CNT1;\nreg [5:0] CNT2;\n\nalways @(posedge CLK)\nbegin\n    if (RED == 17'b11101010011000000)\n         RED = 0;    \n    else\n        RED <= RED + 1;\nend\n\nalways @(negedge CLK)\nbegin\n    if (RED == 0)\n       CNT1 <= CNT1 + 1;\nend\n\nalways @(posedge CLK)\nbegin\n    if (CNT1 == 6'b111111)\n       CNT2 <= CNT2 + 1;\nend\n\n\nassign CNT1[5] = V[5];   assign CNT2[5] = I[5]; \nassign CNT1[4] = V[4];   assign CNT2[4] = I[4];\nassign CNT1[3] = V[3];   assign CNT2[3] = I[3];\nassign CNT1[2] = V[2];   assign CNT2[2] = I[2];\nassign CNT1[1] = V[1];   assign CNT2[1] = I[1];\nassign CNT1[0] = V[0];   assign CNT2[0] = I[0];",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "CLK"
                }
              ],
              "out": [
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
              ]
            }
          },
          "position": {
            "x": 976,
            "y": 344
          },
          "size": {
            "width": 664,
            "height": 632
          }
        },
        {
          "id": "d9b9abbc-13b1-4a7e-9b3d-ffe2e23e779d",
          "type": "basic.code",
          "data": {
            "code": "//DETECTOR DE ERROR\n\nwire [11:0] CMP;\n\nassign CMP[11] = P[11] == PS[11] ? 0 : 1;\nassign CMP[10] = P[10] == PS[10] ? 0 : 1;\nassign CMP[9] = P[9] == PS[9] ? 0 : 1;\nassign CMP[8] = P[8] == PS[8] ? 0 : 1;\nassign CMP[7] = P[7] == PS[7] ? 0 : 1;\nassign CMP[6] = P[6] == PS[6] ? 0 : 1;\nassign CMP[5] = P[5] == PS[5] ? 0 : 1;\nassign CMP[4] = P[4] == PS[4] ? 0 : 1;\nassign CMP[3] = P[3] == PS[3] ? 0 : 1;\nassign CMP[2] = P[2] == PS[2] ? 0 : 1;\nassign CMP[1] = P[1] == PS[1] ? 0 : 1;\nassign CMP[0] = P[0] == PS[0] ? 0 : 1;\n\nassign ERR = CMP[11] | CMP[10] | CMP[9] | CMP [8] | CMP[7] | CMP[6]\n| CMP[5] | CMP[4] | CMP [3] | CMP[2] | CMP [1] | CMP[0];",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "P",
                  "range": "[11:0]",
                  "size": 12
                },
                {
                  "name": "PS",
                  "range": "[11:0]",
                  "size": 12
                }
              ],
              "out": [
                {
                  "name": "ERR"
                }
              ]
            }
          },
          "position": {
            "x": 2112,
            "y": 472
          },
          "size": {
            "width": 584,
            "height": 328
          }
        },
        {
          "id": "c77c42bc-6f1e-42d2-92c8-ffeb7e813331",
          "type": "basic.code",
          "data": {
            "code": "reg [1:0] ERR = 0;\n\nalways @(posedge CLK)\nbegin\n    if (IN)\n    ERR <= ERR + 1;\nend\n\nassign OUT = ERR;",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "CLK"
                },
                {
                  "name": "IN"
                }
              ],
              "out": [
                {
                  "name": "OUT",
                  "range": "[1:0]",
                  "size": 2
                }
              ]
            }
          },
          "position": {
            "x": 2760,
            "y": 504
          },
          "size": {
            "width": 288,
            "height": 176
          }
        },
        {
          "id": "18f50457-cb15-4f1b-b419-ac5f8fcbfce0",
          "type": "fc99f0294faf65a8a828c679f0ed86b73e3396cc",
          "position": {
            "x": 1840,
            "y": 488
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "776d7d1f-dc1d-4920-9ac4-23fb69828f23",
          "type": "ec4e8645c54db8449908e1dfbb22f0c7ed511bef",
          "position": {
            "x": 1840,
            "y": 768
          },
          "size": {
            "width": 96,
            "height": 64
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "664ab7a0-d991-4200-ace3-0d76ef1fac7a",
            "port": "I"
          },
          "target": {
            "block": "a1457931-3fce-402e-a42e-44a5ee83153d",
            "port": "in"
          },
          "vertices": [
            {
              "x": 1712,
              "y": 864
            }
          ],
          "size": 6
        },
        {
          "source": {
            "block": "5eaef775-2454-4ac4-b2e6-7fd1ab75c676",
            "port": "out"
          },
          "target": {
            "block": "664ab7a0-d991-4200-ace3-0d76ef1fac7a",
            "port": "CLK"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "d9b9abbc-13b1-4a7e-9b3d-ffe2e23e779d",
            "port": "ERR"
          },
          "target": {
            "block": "c77c42bc-6f1e-42d2-92c8-ffeb7e813331",
            "port": "IN"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "5eaef775-2454-4ac4-b2e6-7fd1ab75c676",
            "port": "out"
          },
          "target": {
            "block": "c77c42bc-6f1e-42d2-92c8-ffeb7e813331",
            "port": "CLK"
          },
          "vertices": [
            {
              "x": 1856,
              "y": 248
            },
            {
              "x": 2720,
              "y": 368
            }
          ]
        },
        {
          "source": {
            "block": "c77c42bc-6f1e-42d2-92c8-ffeb7e813331",
            "port": "OUT"
          },
          "target": {
            "block": "010f3940-42a5-47ae-a0d7-41f95fd99102",
            "port": "in"
          },
          "size": 2
        },
        {
          "source": {
            "block": "664ab7a0-d991-4200-ace3-0d76ef1fac7a",
            "port": "V"
          },
          "target": {
            "block": "18f50457-cb15-4f1b-b419-ac5f8fcbfce0",
            "port": "ae2d562c-573c-486d-a216-de0fea933b7b"
          },
          "size": 6
        },
        {
          "source": {
            "block": "664ab7a0-d991-4200-ace3-0d76ef1fac7a",
            "port": "I"
          },
          "target": {
            "block": "18f50457-cb15-4f1b-b419-ac5f8fcbfce0",
            "port": "a0114bf7-e382-43ac-85f3-07e4477eac9e"
          },
          "size": 6
        },
        {
          "source": {
            "block": "18f50457-cb15-4f1b-b419-ac5f8fcbfce0",
            "port": "f9f689ee-ff5c-4cce-a107-77a413ea9187"
          },
          "target": {
            "block": "d9b9abbc-13b1-4a7e-9b3d-ffe2e23e779d",
            "port": "P"
          },
          "vertices": [
            {
              "x": 2008,
              "y": 536
            }
          ],
          "size": 12
        },
        {
          "source": {
            "block": "664ab7a0-d991-4200-ace3-0d76ef1fac7a",
            "port": "I"
          },
          "target": {
            "block": "776d7d1f-dc1d-4920-9ac4-23fb69828f23",
            "port": "55c4a0e5-7cdc-4953-a6f8-5f330663bdec"
          },
          "size": 6
        },
        {
          "source": {
            "block": "664ab7a0-d991-4200-ace3-0d76ef1fac7a",
            "port": "V"
          },
          "target": {
            "block": "776d7d1f-dc1d-4920-9ac4-23fb69828f23",
            "port": "938d87d6-1fca-4f23-97d5-bd227866e61e"
          },
          "vertices": [
            {
              "x": 1712,
              "y": 776
            }
          ],
          "size": 6
        },
        {
          "source": {
            "block": "776d7d1f-dc1d-4920-9ac4-23fb69828f23",
            "port": "6fc4a3df-0366-4bc2-b1d3-c7ec06daae55"
          },
          "target": {
            "block": "d9b9abbc-13b1-4a7e-9b3d-ffe2e23e779d",
            "port": "PS"
          },
          "vertices": [
            {
              "x": 2016,
              "y": 768
            }
          ],
          "size": 12
        }
      ]
    }
  },
  "dependencies": {
    "fc99f0294faf65a8a828c679f0ed86b73e3396cc": {
      "package": {
        "name": "MULT LOGIC",
        "version": "1.5",
        "description": "",
        "author": "UNIKE",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "ae2d562c-573c-486d-a216-de0fea933b7b",
              "type": "basic.input",
              "data": {
                "name": "V",
                "range": "[5:0]",
                "clock": false,
                "size": 6
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
                "size": 12
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
                "clock": false,
                "size": 6
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
      }
    },
    "ec4e8645c54db8449908e1dfbb22f0c7ed511bef": {
      "package": {
        "name": "M_LGC_SIMPLE",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "938d87d6-1fca-4f23-97d5-bd227866e61e",
              "type": "basic.input",
              "data": {
                "name": "V",
                "range": "[5:0]",
                "clock": false,
                "size": 6
              },
              "position": {
                "x": 296,
                "y": 176
              }
            },
            {
              "id": "6fc4a3df-0366-4bc2-b1d3-c7ec06daae55",
              "type": "basic.output",
              "data": {
                "name": "PS",
                "range": "[11:0]",
                "size": 12
              },
              "position": {
                "x": 1160,
                "y": 224
              }
            },
            {
              "id": "55c4a0e5-7cdc-4953-a6f8-5f330663bdec",
              "type": "basic.input",
              "data": {
                "name": "I",
                "range": "[5:0]",
                "clock": false,
                "size": 6
              },
              "position": {
                "x": 296,
                "y": 280
              }
            },
            {
              "id": "c965d4c1-db21-49e0-9846-cfad58ffad49",
              "type": "basic.code",
              "data": {
                "code": "//MULT LOGIC SIMPLE; A PARTIR DE LIBRERÍA\n\nassign PS = V * I;",
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
                      "name": "PS",
                      "range": "[11:0]",
                      "size": 12
                    }
                  ]
                }
              },
              "position": {
                "x": 472,
                "y": 152
              },
              "size": {
                "width": 584,
                "height": 208
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "938d87d6-1fca-4f23-97d5-bd227866e61e",
                "port": "out"
              },
              "target": {
                "block": "c965d4c1-db21-49e0-9846-cfad58ffad49",
                "port": "V"
              },
              "size": 6
            },
            {
              "source": {
                "block": "55c4a0e5-7cdc-4953-a6f8-5f330663bdec",
                "port": "out"
              },
              "target": {
                "block": "c965d4c1-db21-49e0-9846-cfad58ffad49",
                "port": "I"
              },
              "size": 6
            },
            {
              "source": {
                "block": "c965d4c1-db21-49e0-9846-cfad58ffad49",
                "port": "PS"
              },
              "target": {
                "block": "6fc4a3df-0366-4bc2-b1d3-c7ec06daae55",
                "port": "in"
              },
              "size": 12
            }
          ]
        }
      }
    }
  }
}