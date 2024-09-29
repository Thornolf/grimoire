import consumer from "./consumer"

const missionId = document.body.dataset.missionId;
if (missionId) {
  consumer.subscriptions.create(
    { channel: "MissionChannel", mission_id: missionId },
    {
      connected() {
        console.log("Connected to MissionChannel for mission", missionId);
      },
      disconnected() {
        console.log("Disconnected from MissionChannel");
      },
      received(data) {
        console.log("Received data:", data);
      }
    }
  );
} else {
  console.warn("mission_id is null, not subscribing to MissionChannel");
}
