#!/usr/bin/python3

import can, requests, json, time


def convertZenohToCAN():

    bus = can.interface.Bus("vcan0", bustype='socketcan')

    while True:
        response = requests.get("http://localhost:8000/demo/example/can")

        tunneledMsg = json.loads(response.json()[0]["value"])
        canMsg = can.Message(arbitration_id=tunneledMsg["id"], data=tunneledMsg["payload"])
        bus.send(canMsg)
        time.sleep(0.200)

if __name__ == "__main__":
    convertZenohToCAN()
