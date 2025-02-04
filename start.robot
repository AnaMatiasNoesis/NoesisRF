*** Settings ***
Library  SeleniumLibrary


*** Keywords ***


*** Variables ***
${login}  Admin
${password}  Admin123
@{Dias_da_semana}  Domingo  Segunda  Terça  Quarta  Quinta  Sexta  Sabado
&{Cadastro}  nome=Ana  email=analuciaserram@gmail.com  mae=Henriqueta


*** Keywords ***

*** Test Cases ***
Aceder a um site
    [Tags]  logar
    Open Browser  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login  chrome  options=add_argument("--start-maximized")
    Wait Until Element Is Enabled  xpath://input[@name="username"]  20
    Input Text  xpath://input[@name="username"]  Admin
    Input Text  xpath://input[@placeholder="Password"]  admin123
    Click Button  xpath://button[text()=" Login "]
    Sleep  5
    Page Should Contain Image  //img[@src="/web/images/orange.png?v=1721393199309"]
    Capture Page Screenshot

    Click Link    //a[@href="/web/index.php/admin/viewAdminModule"]
    Sleep  3
    Element Should Be Visible    //h6[text()="User Management"]


Analisar Variaveis
    [Tags]  var
    Log To Console    ${login}
    Log To Console    ${Dias_da_semana[6]}
    Log To Console    ${Cadastro.mae}