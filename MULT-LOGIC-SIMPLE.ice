{
  "version": "1.2",
  "package": {
    "name": "M_LGC_SIMPLE",
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
          "id": "938d87d6-1fca-4f23-97d5-bd227866e61e",
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
  },
  "dependencies": {}
}