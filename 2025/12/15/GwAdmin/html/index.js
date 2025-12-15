document.addEventListener("DOMContentLoaded", () => {
    // Charger l'API de l'IFrame Player YouTube si ce n'est pas encore fait
    if (!window.YT) {
        const tag = document.createElement("script");
        tag.src = "https://www.youtube.com/iframe_api";
        const firstScriptTag = document.getElementsByTagName("script")[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    }

    window.onYouTubeIframeAPIReady = () => {
        window.addEventListener("message", (event) => {
            const data = event.data;

            if (data.action === "playVideo") {
                const videoContainer = document.querySelector(".video-container");
                const iframe = document.getElementById("videoPlayer");

                if (videoContainer && iframe) {
                    if (data.url) {
                        iframe.src = `https://www.youtube.com/embed/${data.url}?enablejsapi=1&autoplay=1`;

                        videoContainer.style.display = "flex"; // Afficher le conteneur
                        const player = new YT.Player(iframe, {
                            events: {
                                onStateChange: (event) => {
                                    if (event.data === YT.PlayerState.ENDED) {
                                        videoContainer.style.display = "none";
                                        iframe.src = "";
                                        fetch("https://resource_name/stopVideo", {
                                            method: "POST",
                                            headers: {
                                                "Content-Type": "application/json",
                                            },
                                            body: JSON.stringify({ status: "done" }),
                                        });
                                    }
                                },
                            },
                        });
                    } else {
                        console.error("URL de vidéo manquante dans le message NUI.");
                    }
                } else {
                    console.error("Impossible de trouver l'élément iframe ou conteneur.");
                }
            }
        });
    };
});
