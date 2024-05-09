### TODO

[x] rename project

[x] uuid / unique id / other auto fields

[x] env file stuff

[x] can we move the mapper to the datasource??

[x] sortable fields dynamic 

[ ] for dashboard, allow icon to change without readding the whole thing (smaller needle)

[ ] supabase image upload

[x] image choosing for macos

[x] ui heading / subtitles / etc.

[ ] docs for blueprint config

[x] remove use cases from asset / auth

[ ] profile model stuff

[ ] validate blueprint (auto gen fields aren't used)

[ ] blueprint meta: allow removing autogen fields

[ ] fix yaml config for types (ie char/string etc. ) make dart like

[ ] routes get from namespace

[ ] double check delete invalidate / redirect
 

==== SQL FIXES ===



- add includeToJson: false for id, uid, createdAt, updatedAt
- uid uuid default uuid_generate_v4(),