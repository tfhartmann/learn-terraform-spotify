terraform {
  required_providers {
    spotify = {
      version = "~> 0.1.5"
      source  = "conradludgate/spotify"
    }
  }
}

variable "spotify_api_key" {
  type = string
}

provider "spotify" {
  api_key = var.spotify_api_key
}

resource "spotify_playlist" "playlist" {
  name        = "Flowers of LV-426"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    data.spotify_search_track.robot.tracks[0].id,
    data.spotify_search_track.ghost.tracks[0].id,
    data.spotify_search_track.vnv.tracks[0].id,
    data.spotify_search_track.vnv.tracks[1].id,
  ]
}

data "spotify_search_track" "ghost" {
  #  artists = ["Chrysalis"]
  #  album = "Jolene"
  name  = "lithium flower"
}

data "spotify_search_track" "robot" {
  #  artists = ["Chrysalis"]
  #  album = "Jolene"
    name  = "I Am Robot Hear Me Glitch"
}

data "spotify_search_track" "vnv" {
    artists = ["VNV Nation"]
  #  album = "Jolene"
  # name  = "I Am Robot Hear Me Glitch"
}

output "tracks" {
  value = [data.spotify_search_track.robot.tracks, data.spotify_search_track.ghost.tracks, data.spotify_search_track.vnv.tracks]
}
