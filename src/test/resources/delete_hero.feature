@REQ_BTPMCDP-04 @HU04 @marvel-characters @Agente2 @E2
Feature: BTPMCDP-04 delete Marvel characters

  Background:
    * configure ssl = true

  @id:1 @deleteHero @success204
  Scenario: eliminar personaje exitosamente
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/119'
    When method delete
    Then status 204

  @id:2 @deleteHero @notFound404
  Scenario: eliminar personaje que no existe responde 404
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/999'
    When method delete
    Then status 404
    And match response == { "error": "Character not found" }
