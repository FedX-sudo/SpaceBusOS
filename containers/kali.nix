 { config, pkgs, ... }:
 {
   config.virtualisation.oci-containers.containers = {
     hackagecompare = {
       image = "docker.io/kalilinux/kali-bleeding-edge";
       ports = ["127.0.0.1:3010:3010"];
       volumes = [
         ];
       cmd = [
         
       ];
     };
   };
 }
