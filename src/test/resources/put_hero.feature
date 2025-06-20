@REQ_BTPMCDP-03 @HU03 @marvel-characters @Agente2 @E2
Feature: BTPMCDP-03 put Marvel characters

  Background:
    * configure ssl = true

  @id:1 @putHero @success200
  Scenario: actualizar personaje exitosamente
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/118'
    And request
      """
      {
        "name": "Iron Manto",
        "alterego": "Tony Stark",
        "description": "Updated description",
        "powers": ["Armor", "Flight"]
      }
      """
    When method put
    Then status 200

  @id:2 @putHero @notFound404
  Scenario: actualizar personaje que no existe responde 404
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/999'
    And request
      """
      {
        "name": "Iron Man",
        "alterego": "Tony Stark",
        "description": "Updated description",
        "powers": ["Armor", "Flight"]
      }
      """
    When method put
    Then status 404
