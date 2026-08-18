MARY Online Services static server root

Host the CONTENTS of this directory on an HTTPS static host.
Configure CORS so the MARYOS executable/client may read JSON and package files.
Then enter that root URL in MARY Online Services.


RC1 RELEASE RULE
----------------
Keep update.json at Build 96.100 until a real newer update package exists.
update.example-future.json is only an example.

Before publishing a newer build:
1. build the real update package
2. compute its actual SHA-256
3. upload the package
4. test its URL
5. change update.json LAST
