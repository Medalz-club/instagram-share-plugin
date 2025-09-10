import { InstagramShare } from 'instagram-share-plugin';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    InstagramShare.echo({ value: inputValue })
}
