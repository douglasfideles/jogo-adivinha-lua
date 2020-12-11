--[[
MEU PRIMEIRO PROGRAMA NA LINGUAGEM `LUA`
--]]


function  aberturaJogo()
    print("Bem vindo ao Jogo Advinhe nÃºmero\
    \n")
end

function manual()
    print("Voce deseja ler o manual do jogo?\n")
    local resposta = io.read()
    if resposta == "sim" then
        print("Este e um jogo de adivinhacao onde o computador ira\
        escolher um numero aleatorio, que o jogador precisara\
        descobir por simples processo de tentativa e erro.")
    end

end

function numeroAleatorio()
    seed = os.clock()*100000
    math.randomseed(seed)
    return math.random(1,100)

end

function capturaPalpite()
    while true do
        palpite = io.read()
        if type(tonumber(palpite)) == "number" then
            palpite = tonumber(palpite)
            if palpite > 100 or palpite < 1 then
                print("palpite invalido! Use um numero entre 1 e 100")

            else
                return palpite

            end
        
        else 
            print("Digite um numero!")

        end
    end

end

function comparaPalpite(numeroAleatorio, palpite)
    if numeroAleatorio == palpite then
        return true
    else
        if numeroAleatorio < palpite then variacao = "menor" else variacao = "maior" end
        print("O numero que o computador esta pensando e: "..variacao)
        print("\n")
        return false
    end
end


function imprimeInteracao(numero, resultadoTentativa)
    if resultadoTentativa then
        print("Parabens! Voce acertou o numero: "..numero)
    else
        print("Esse nao e o numero que o computador esta pensado!\n Tente novamente\n")
    
    return not resultadoTentativa
    end
end

function partida(numeroSecreto)
    palpite = capturaPalpite()
    return imprimeInteracao(numeroSecreto, comparaPalpite(numeroSecreto, palpite))
end

function loopPrincipal()

    numeroSecreto = numeroAleatorio()
    continuaJogo = true
    while continuaJogo do

        continuaJogo = partida(numeroSecreto)
        print("\n Deseja jogar novamente?SIM ou NAO")
        resposta = io.read()
        if resposta == "nao" then
            continuaJogo = false 
        end
    
    end
end

function jogo()

    repeteJogo = true

    loopPrincipal()
        


end

aberturaJogo()
manual()
jogo()






