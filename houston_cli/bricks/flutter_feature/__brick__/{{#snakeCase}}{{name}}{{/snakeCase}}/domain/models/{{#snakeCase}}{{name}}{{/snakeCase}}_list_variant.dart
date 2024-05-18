enum {{#pascalCase}}{{name}}{{/pascalCase}}ListVariant {
  all,
  isOwner,
  {{listVariantRelationshipOptions}}
  ;
}
