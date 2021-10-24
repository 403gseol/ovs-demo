#!/usr/bin/python3

import can, requests, json


def convertCANToZenoh():

    bus = can.interface.Bus("vcan0", bustype='socketcan')

    while True:
        msg = bus.recv()
        intPayload = [x for x in msg.data]

        canMsg = {
            "id": msg.arbitration_id,
            "payload": intPayload
        }
        response = requests.put("http://localhost:8000/demo/example/can", json=json.dumps(canMsg))

        print(response, response.text, canMsg)


if __name__ == "__main__":
    convertCANToZenoh()
