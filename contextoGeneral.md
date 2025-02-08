# Configuração do Contexto [general] em sip.conf para Asterisk

Este exemplo mostra uma configuração básica do contexto `[general]` no arquivo `sip.conf` para configurar o protocolo SIP no Asterisk.

```ini
[general]
; Habilitar o suporte ao protocolo SIP
port=5060                        ; Porta do servidor SIP (padrão é 5060)
bindaddr=0.0.0.0                 ; Endereço IP para o qual o Asterisk vai escutar (0.0.0.0 escuta em todos os endereços)
context=default                  ; Contexto de entrada para as chamadas (o padrão é 'default')
transport=udp                    ; Tipo de transporte para SIP (UDP, TCP, TLS)
disallow=all                     ; Desabilita todos os codecs
allow=ulaw,alaw                  ; Permite apenas os codecs ulaw e alaw (padrões de áudio em VoIP)
srvlookup=yes                    ; Permite pesquisa de SRV para resolução de DNS
nat=yes                          ; Habilita o NAT para funcionar por trás de um roteador/firewall
qualify=yes                      ; Ativa o monitoramento de qualidade de chamadas (ping)
maxexpiry=3600                   ; Tempo máximo de expiração de um registro SIP
minexpiry=60                      ; Tempo mínimo de expiração de um registro SIP
call-limit=100                   ; Limite máximo de chamadas simultâneas por cliente SIP
language=pt_BR                   ; Definir idioma das mensagens (opcional)

; Configurações adicionais de segurança
rtptimeout=30                    ; Tempo limite para RTP (se não houver pacotes RTP dentro desse tempo, a chamada será encerrada)
rtpholdtimeout=300               ; Tempo limite para uma chamada em espera
directmedia=no                   ; Impede a comunicação direta entre os dispositivos de mídia (para segurança e controle de tráfego)

; Configurações de debug
sipdebug=yes                      ; Habilita o log de debug do SIP para análise de tráfego

## Explicação das Configurações
port=5060: Define a porta que o Asterisk usará para comunicação SIP. O padrão é 5060.
bindaddr=0.0.0.0: O endereço IP no qual o Asterisk escutará por conexões SIP. Usar 0.0.0.0 faz com que o Asterisk escute em todas as interfaces de rede.
context=default: Este é o contexto do dialplan onde as chamadas recebidas serão direcionadas. Você pode substituir default por outro nome de contexto, se necessário.
transport=udp: Define o tipo de transporte a ser utilizado. SIP pode operar em UDP, TCP ou TLS. O padrão é UDP.
disallow=all / allow=ulaw,alaw: Aqui, você está desabilitando todos os codecs e, em seguida, permitindo apenas ulaw e alaw (dois codecs populares em VoIP).
nat=yes: Se o Asterisk estiver atrás de um NAT (roteador), essa opção ajuda a lidar com as mudanças de IP e porta.
qualify=yes: Permite ao Asterisk monitorar a qualidade das conexões SIP.
sipdebug=yes: Ativa a depuração SIP no Asterisk, útil para diagnóstico e resolução de problemas.
Essas configurações básicas devem ser suficientes para você começar a usar o protocolo SIP no Asterisk. Para adicionar extensões ou trunks, você precisará configurar mais opções nos arquivos subsequentes, como as seções [usuarios] e [trunks] dentro de sip.conf.

less
Copiar
Editar
