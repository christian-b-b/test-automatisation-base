@REQ_BTPMCDP-01 @HU01 @marvel-characters @Agente2 @E2
Feature: BTPMCDP-01 get Marvel characters

  Background:
    * configure ssl = true

  @id:1 @getHero @successfullRequest200
  Scenario: succesfull all heros request responde 200
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    When method get
    Then status 200

  @id:2 @getHero @successfullRequest200
  Scenario: successfull request hero by id responde 200
    * def idHero = 110
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/' + idHero
    When method get
    Then status 200
    And match response == karate.read('classpath:data/response_get_hero_by_id_200.json')

  @id:3 @getHero @unsuccessfullRequest404
  Scenario: successfull request hero by id responde 200
    * def idHero = 999
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/' + idHero
    When method get
    Then status 404
    And match response == { error: 'Character not found' }

