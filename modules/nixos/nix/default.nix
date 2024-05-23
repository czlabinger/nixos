{...}: {
  nix = {
    settings = {
      auto-optimise-store = true;

      substituters = [
        "https://hyprland.cachix.org"
        #"https://192.168.123.71:54321"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" 
        #"192.168.123.71:3htfkeaAxwll01vGHm3Dg/XvTKiVw1Xb1fEyMvpAtLw="
      ];

      experimental-features = ["nix-command" "flakes"];
    };

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  security.pki.certificates = [''  
-----BEGIN CERTIFICATE-----
MIIFXzCCA0egAwIBAgIQIcSfOOr+TKZNrNk553AlYDANBgkqhkiG9w0BAQsFADBB
MRMwEQYKCZImiZPyLGQBGRYDeHl6MRYwFAYKCZImiZPyLGQBGRYGaGdiNTBjMRIw
EAYDVQQDEwlIR0I1MEMtQ0EwIBcNMjQwNTE1MjA0NzA1WhgPMjEyNDA1MTUyMDU3
MDVaMEExEzARBgoJkiaJk/IsZAEZFgN4eXoxFjAUBgoJkiaJk/IsZAEZFgZoZ2I1
MGMxEjAQBgNVBAMTCUhHQjUwQy1DQTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCC
AgoCggIBAKudYowjivFiwvaygY0psfDcQbwPS337xiGnQ6RVvDPXf2fHiPAVaNVF
vZE8xtVKZMFyAop8CCUN3IfYVfX1dCmr1S7iMFSJKlvSI1yFotij0S3yMMmJZOhE
8DQGzXaOSajZoSRWg/mU+4QYXRnz+8zxljHuYrDxvx0NFnkKxUTsdJHJycRZ1UN6
ef4bvZuw1PxZqr7EKu7/WGd8cDvp6n3Fxp5DvhLHObmGW6dpzULsN1w1Sar4hZdE
FS29uwsWtzPUHwYe2rjwNPb0MF9TYJ/4mn+jvQNPqFasveUc7omuhiCmcjokNUP9
ll72C5fydQ5ve4i6wpnMPQAK84bCgJc62aOaP3An12tjPEfJ6l66yZA/3fp4gdYl
Vj9RsfI7LUoxJC1wbw0piDBjDf+E/UL19FeaqvfBqtaTv25aF0n4XWPU3ZcLVKWk
TdBO64vUvRjfk7iTJo5KRHXQFw+2MukCBwVqWP6zNUyxpDp5w0KQbFOOE0eb0XXn
gA8heVuzUpZKt6TRPJNO6igWy2OyaDI2n2M2s8UIaAPVkLVu3fTAPUImyMJy6fVi
5FM+wTlKtqvi3qZbJfE031N/H4irgGjDZ0apHxwSUmkbr6FAyMHBU3NLxoab8KM9
7Ex9kOBCcmaHe3XfhUQr72GNzlBQ3VPq/irFdDurphCJWD85oVcdAgMBAAGjUTBP
MAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSlDSC6lAuE
frx9z22SLEnjgbnBwzAQBgkrBgEEAYI3FQEEAwIBADANBgkqhkiG9w0BAQsFAAOC
AgEAmxxjLs4tZ74cxquvZ+w9CTaA2lVhvzDyICWqI8kP7yHJ60heHPxftAlP6BXA
elEaw4wA4sF6Qk6kS1rikUGA42TJxaT6yRDm/1DRZl7guJuEqC/YljG6jEh5CUrX
YJ3FMb021Ko4231xZlt3upyz6VKL5/MDcVDRqF/mu4moVg6hmzNfSxfEswMTANVA
VqbSK0xcw3R8am3srv7z4Dc61p9i4azxlUgJBXn7v5eHUVva9G9iDuAwMdjNBabN
ecipwoU1nzbEyyGjOl8vWFB4bJGBm+4UyDlyinp/i9aY8keSlAPlckUBvDCqi3Yq
RbinP21o58w0nY2aKhNTaZIUr00osumzr0W3cJTdl+iWN7rR8Kbcq2p40FklMrlv
24yngs+Cs80zK56rSkaVt8evLrzq+VEzoceaChQunPy+H8vMOtljKRjUgbt/qpDk
LQO/LOERDcMVO5JD8gIOejInK4NW559Kjpxj2FxxMsIT30U7C/diODrkF2GZGbat
mN45ysu9ni+wcGQU93QTi2WrbR1gispnd53Oe2P/d+syBwy63+XtgWqdQGcC5z3y
FKsFBg74tERo6oWG1K7XeexyhDcW12vpinZ6SfScyHT60mcSWcyldmLhZaKLETxN
9ONGo14TEvvnYWLRA3rCUO32wVrgcOKx/JDX57+AkP5l1gI=
-----END CERTIFICATE-----
  ''];
  
}
