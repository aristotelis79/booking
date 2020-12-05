import socket from './socket'
console.log("id: ", document.querySelector('#id').dataset.id)
let id = document.querySelector('#id').dataset.id;
// if (!id) {
//     return;
// }

let channel = socket.channel("event:" + id, {});

channel.on("update_quantity", event => {
    console.log("Update: ", event);
    document.querySelector('h4 span').innerHTML = event.quantity;
});

channel.join()
    .receive("ok", resp => { console.log("joined successfully event: " + id, resp) })
    .receive("error", resp => { console.log("Unable to join", resp) });

