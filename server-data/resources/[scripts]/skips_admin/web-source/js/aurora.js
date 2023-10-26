$(() => {
  window.addEventListener('message', function (a6) {
    var a8 = a6.data
    switch (a8.action) {
      case 'showMenu':
        a1(),
          Y(),
          s(),
          $('.background-main').fadeIn(),
          $('.welcoming').fadeIn().delay(1000).css('margin-left', '1vw'),
          $('.administrator').fadeIn().delay(1000).css('margin-left', '3vw'),
          $('.sub-message').fadeIn().delay(1000).css('margin-left', '5vw')
        break
      case 'closeMenu':
        $('.background-main').fadeOut(),
          $('#group-search').val(''),
          $('#items-search').val(''),
          $('.welcoming').fadeOut().css('margin-left', '0vw'),
          $('.administrator').fadeOut().css('margin-left', '0vw'),
          $('.sub-message').fadeIn().delay(1000).css('margin-left', '0vw')
        break
    }
  })
  var h = false
  window.addEventListener('message', function (a6) {
    var a7 = a6.data
    switch (a7.taction) {
      case 'showTicket':
        $('.ticket-bg-main').fadeIn(), (h = true)
        break
      case 'closeTicket':
        $('.ticket-bg-main').fadeOut(), (h = false)
        break
    }
  })
  let i = document.getElementById('allow-confirm-box'),
    j = false,
    k = false,
    l = false,
    m = false,
    n = false,
    o = false,
    p = false
  document.onkeyup = function (a6) {
    if (a6.which == 27) {
      if (!h) {
        if (j) {
          $('.config-display').fadeOut()
          j = false
        } else {
          if (k) {
            $('.input-background').fadeOut(), (k = false)
          } else {
            if (a0) {
              $('.item-list-bg').fadeOut()
              $('#item-to-id').val('')
              $('#item-list-amount').val('')
              $('#item-list-search').val('')
              a0 = false
            } else {
              if (Q) {
                !R &&
                  ($('.weapon-list-bg').fadeOut(),
                  $('.takeweapons-bg').fadeOut(),
                  $('#wpl-search').val(''),
                  (Q = false))
              } else {
                if (m) {
                  !n && ($('.notify-bg').fadeOut(), (m = false))
                } else {
                  if (o) {
                    $('.teleport-bg').fadeOut()
                    o = false
                  } else {
                    if (p) {
                      $('.logs-bg').fadeOut()
                      $('#logs-search').val('')
                      p = false
                    } else {
                      !l && $.post('http://skips_admin/TriggerUI')
                    }
                  }
                }
              }
            }
          }
        }
      } else {
        $.post('http://skips_admin/TriggerTicketUI')
      }
    }
  }
  var q = false
  $('.general-button').click(function () {
    !q
      ? ($('.general-buttons-list').fadeIn(),
        t(),
        (q = true),
        $('.general-button > i').removeClass('fas fa-arrow-right'),
        $('.general-button > i').addClass('fas fa-arrow-down'),
        $('.actions-button').css('margin-top', '27vh'),
        $('.actions-buttons-list').css('margin-top', '32.9vh'),
        $('.general-button').css('background-color', '#0e0e0e'))
      : ($('.general-buttons-list').fadeOut(100),
        (q = false),
        $('.general-button > i').removeClass('fas fa-arrow-down'),
        $('.general-button > i').addClass('fas fa-arrow-right'),
        $('.actions-button').css('margin-top', '0vh'),
        $('.actions-buttons-list').css('margin-top', '5.8vh'),
        $('.general-button').css('background-color', '#272626'))
  })
  var r = false
  $('.actions-button').click(function () {
    !r
      ? ($('.actions-buttons-list').stop().fadeTo(100, 1),
        (r = true),
        t(),
        $('.actions-button > i').removeClass('fas fa-arrow-right'),
        $('.actions-button > i').addClass('fas fa-arrow-down'),
        $('.actions-button').css('background-color', '#0e0e0e'))
      : ($('.actions-buttons-list').stop().fadeTo(100, 0).delay(200).fadeOut(),
        (r = false),
        $('.actions-button > i').removeClass('fas fa-arrow-down'),
        $('.actions-button > i').addClass('fas fa-arrow-right'),
        $('.actions-button').css('background-color', '#272626'))
  })
  $('.config-box').click(function () {
    $('.config-display').fadeIn(150)
    j = true
  })
  const s = () => {
      $('.qa-button').off()
      let a7 = ''
      $('#spawn-vehicle').click(function () {
        a7 = 'spawn_veh'
        const a9 = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(a9), (aa) => {
          let ac = aa.isAllowed
          ac
            ? ($('.input-box-title p').text('Digite abaixo o modelo:'),
              z(),
              $('#text-input-confirm').click(function () {
                var ae = $('#input-value').val()
                const ag = { vehicle: ae }
                $.post('http://skips_admin/spawnVehicle', JSON.stringify(ag))
                k && ($.post('http://skips_admin/TriggerUI'), A())
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
      $('#kill-id').click(function () {
        a7 = 'kill'
        const a9 = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(a9), (aa) => {
          let ad = aa.isAllowed
          ad
            ? ($('.input-box-title p').text('Digite abaixo o ID:'),
              z(),
              $('#text-input-confirm').click(function () {
                var af = $('#input-value').val()
                !isNaN(af)
                  ? ($.post(
                      'http://skips_admin/killid',
                      JSON.stringify({ id: af })
                    ),
                    (B = 'sucesso'),
                    (C = 'SUCESSO!'),
                    (D =
                      'Você matou o ID nº ' +
                      document.getElementsByName('input-text')[0].value),
                    E(),
                    A())
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite um ID válido, utilize apenas caracteres numéricos.'),
                    E(),
                    A())
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
      $('#kill-all').click(function () {
        a7 = 'kill_all'
        const a9 = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(a9), (aa) => {
          let ac = aa.isAllowed
          ac
            ? (i.checked
                ? ($('.cb-main-text span').text('MATAR A TODOS'), v())
                : ((B = 'sucesso'),
                  (C = 'SUCESSO!'),
                  (D = "Você matou a todos os ID's"),
                  E(),
                  setTimeout(function () {
                    $.post('http://skips_admin/killall')
                  }, 2000)),
              $('#confirm-box-cancel').click(function () {
                w()
              }),
              $('#confirm-box-confirm').click(function () {
                $('.success-text span').text('Você matou a todos.'),
                  x(),
                  setTimeout(function () {
                    $.post('http://skips_admin/killall')
                  }, 1500)
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
      $('#revive-id').click(function () {
        a7 = 'revive'
        const a9 = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(a9), (aa) => {
          let ad = aa.isAllowed
          ad
            ? ($('#text-input-confirm').off(),
              $('.input-box-title p').text('Digite abaixo o ID:'),
              z(),
              $('#text-input-confirm').click(function () {
                var af = $('#input-value').val()
                !isNaN(af)
                  ? ($.post(
                      'http://skips_admin/reviveid',
                      JSON.stringify({ id: af })
                    ),
                    A(),
                    (B = 'sucesso'),
                    (C = 'SUCESSO!'),
                    (D =
                      'Você reviveu o ID nº ' +
                      document.getElementsByName('input-text')[0].value),
                    E())
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite um ID válido, utilize apenas caracteres numéricos.'),
                    E(),
                    A())
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
      $('#revive-all').click(function () {
        a7 = 'revive_all'
        const a9 = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(a9), (aa) => {
          let ad = aa.isAllowed
          ad
            ? (i.checked
                ? ($('.cb-main-text span').text('REVIVER A TODOS'), v())
                : ((B = 'sucesso'),
                  (C = 'SUCESSO!'),
                  (D = "Você reviveu a todos os ID's"),
                  E(),
                  setTimeout(function () {
                    $.post('http://skips_admin/reviveall')
                  }, 2000)),
              $('#confirm-box-cancel').click(function () {
                w()
              }),
              $('#confirm-box-confirm').click(function () {
                $('.success-text span').text('Você reviveu a todos.')
                x()
                setTimeout(function () {
                  $.post('http://skips_admin/reviveall')
                }, 1500)
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
      $('#upgrade-veh').click(function () {
        a7 = 'upgrade_veh'
        const a9 = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(a9), (aa) => {
          let ac = aa.isAllowed
          ac
            ? (i.checked
                ? ($('.cb-main-text span').text('MELHORAR VEÍCULO (TEMPORÁRIAMENTE)'), v())
                : ($.post('http://skips_admin/upgradevehicle'),
                  !i.checked &&
                    ((B = 'sucesso'),
                    (C = 'SUCESSO!'),
                    (D = 'Você melhorou seu veículo'),
                    E()),
                  w()),
              $('#confirm-box-cancel').click(function () {
                w()
              }),
              $('#confirm-box-confirm').click(function () {
                $.post('http://skips_admin/upgradevehicle'),
                  window.addEventListener('message', function (ae) {
                    var ag = ae.data
                    if (i.checked) {
                      if (ag.isInVeh == true) {
                        $('.success-text span').text(
                          'Você melhorou seu veículo.'
                        ),
                          x()
                      } else {
                        ag.isInVeh == false &&
                          ($('.fail-text span').text(
                            'Você deve entrar em um veículo para isso.'
                          ),
                          y())
                      }
                    }
                  })
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
      $('#add-wl').click(function () {
        a7 = 'wl_manage'
        const a9 = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(a9), (aa) => {
          let ac = aa.isAllowed
          ac
            ? ($('.input-box-title p').text('Digite abaixo o ID:'),
              z(),
              $('#text-input-confirm').click(function () {
                var ae = $('#input-value').val()
                !isNaN(ae)
                  ? ($.post(
                      'http://skips_admin/addwl',
                      JSON.stringify({ id: ae })
                    ),
                    (B = 'sucesso'),
                    (C = 'SUCESSO!'),
                    (D =
                      'Você adicionou o ID nº ' +
                      document.getElementsByName('input-text')[0].value +
                      ' a whitelist'),
                    E(),
                    A())
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite um ID válido, utilize apenas caracteres numéricos.'),
                    E(),
                    A())
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
      $('#kick-id').click(function () {
        a7 = 'kick_id'
        const aa = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(aa), (ab) => {
          let ad = ab.isAllowed
          ad
            ? ($('.input-box-title p').text('Digite abaixo o ID:'),
              z(),
              $('#text-input-confirm').click(function () {
                var af = $('#input-value').val()
                !isNaN(af)
                  ? ($.post(
                      'http://skips_admin/kickid',
                      JSON.stringify({ id: af })
                    ),
                    (B = 'sucesso'),
                    (C = 'SUCESSO!'),
                    (D =
                      'Você expulsou o ID nº ' +
                      document.getElementsByName('input-text')[0].value),
                    E(),
                    A())
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite um ID válido, utilize apenas caracteres numéricos.'),
                    E(),
                    A())
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
      $('#kick-all').click(function () {
        a7 = 'kick_all'
        const aa = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(aa), (ab) => {
          let ad = ab.isAllowed
          ad
            ? (i.checked
                ? ($('.cb-main-text span').text('EXPULSAR A TODOS'), v())
                : ((B = 'sucesso'),
                  (C = 'SUCESSO!'),
                  (D = "Você expulsou a todos os ID's"),
                  E(),
                  setTimeout(function () {
                    $.post('http://skips_admin/kickall')
                  }, 3000)),
              $('#confirm-box-cancel').click(function () {
                w()
              }),
              $('#confirm-box-confirm').click(function () {
                $('.success-text span').text('Você expulsou a todos.'),
                  x(),
                  setTimeout(function () {
                    $.post('http://skips_admin/kickall')
                  }, 3000)
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
      $('#ban-id').click(function () {
        a7 = 'ban_manage'
        const a9 = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(a9), (aa) => {
          let ad = aa.isAllowed
          ad
            ? ($('.input-box-title p').text('Digite abaixo o ID:'),
              z(),
              $('#text-input-confirm').click(function () {
                var af = $('#input-value').val()
                !isNaN(af)
                  ? ($.post(
                      'http://skips_admin/banid',
                      JSON.stringify({ id: af })
                    ),
                    (B = 'sucesso'),
                    (C = 'SUCESSO!'),
                    (D =
                      'Você baniu o ID nº ' +
                      document.getElementsByName('input-text')[0].value),
                    E(),
                    A())
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite um ID válido, utilize apenas caracteres numéricos.'),
                    E(),
                    A())
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
      $('#unban-id').click(function () {
        a7 = 'ban_manage'
        const aa = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(aa), (ab) => {
          let ae = ab.isAllowed
          ae
            ? ($('.input-box-title p').text('Digite abaixo o ID:'),
              z(),
              $('#text-input-confirm').click(function () {
                var af = $('#input-value').val()
                !isNaN(af)
                  ? ($.post(
                      'http://skips_admin/unbanid',
                      JSON.stringify({ id: af })
                    ),
                    (B = 'sucesso'),
                    (C = 'SUCESSO!'),
                    (D =
                      'Você desbaniu o ID nº ' +
                      document.getElementsByName('input-text')[0].value),
                    E(),
                    A())
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite um ID válido, utilize apenas caracteres numéricos.'),
                    E(),
                    A())
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
      $('#remove-wl').click(function () {
        a7 = 'wl_manage'
        const a9 = { action: a7 }
        $.post('http://skips_admin/checkPermission', JSON.stringify(a9), (aa) => {
          let ad = aa.isAllowed
          ad
            ? ($('.input-box-title p').text('Digite abaixo o ID:'),
              z(),
              $('#text-input-confirm').click(function () {
                var af = $('#input-value').val()
                !isNaN(af)
                  ? ($.post(
                      'http://skips_admin/removewl',
                      JSON.stringify({ id: af })
                    ),
                    (B = 'sucesso'),
                    (C = 'SUCESSO!'),
                    (D =
                      'Você removeu o ID nº ' +
                      document.getElementsByName('input-text')[0].value +
                      ' da whitelist'),
                    E(),
                    A())
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite um ID válido, utilize apenas caracteres numéricos.'),
                    E(),
                    A())
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
        })
      })
    },
    t = () => {
      $('.side-button').off()
      let a8 = ''
      $('#begin').click(function () {
        var ad = $(this)
        $('.groups-content').hide()
        $('.items-content').hide()
        $('.vehicles-content').hide()
        $('.playerlist-content').hide()
        $('.economy-content').hide()
        $('.whitelist-content').hide()
        $('.begin-content').fadeIn(750)
        s()
        $('.side-button').css('background-color', 'transparent')
        ad.css('background-color', '#1d1d1d')
      })
      $('#groups').click(function () {
        a8 = 'groups'
        const ad = { action: a8 }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ad),
          (ae) => {
            let ai = ae.isAllowed
            if (ai) {
              var ag = $(this)
              $('.begin-content').hide()
              $('.items-content').hide()
              $('.vehicles-content').hide()
              $('.playerlist-content').hide()
              $('.economy-content').hide()
              $('.groups-content').fadeIn(750)
              $('.whitelist-content').hide()
              $('.side-button').css('background-color', 'transparent')
              ag.css('background-color', '#1d1d1d')
            } else {
              B = 'negado'
              C = 'ERRO!'
              D = 'Sem permissão.'
              E()
            }
          }
        )
      })
      $('#items').click(function () {
        a8 = 'items'
        const ad = { action: a8 }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ad),
          (ae) => {
            let ah = ae.isAllowed
            if (ah) {
              var ag = $(this)
              $('.begin-content').hide()
              $('.groups-content').hide()
              $('.vehicles-content').hide()
              $('.playerlist-content').hide()
              $('.economy-content').hide()
              $('.items-content').fadeIn(750)
              $('.whitelist-content').hide()
              $('.side-button').css('background-color', 'transparent')
              ag.css('background-color', '#1d1d1d')
            } else {
              ;(B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E()
            }
          }
        )
      })
      $('#vehicles').click(function () {
        a8 = 'vehicles'
        const ad = { action: a8 }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ad),
          (ae) => {
            let ah = ae.isAllowed
            if (ah) {
              var ag = $(this)
              $('.begin-content').hide()
              $('.groups-content').hide()
              $('.items-content').hide()
              $('.playerlist-content').hide()
              $('.economy-content').hide()
              $('.whitelist-content').hide()
              $('.vehicles-content').fadeIn(750)
              V()
              $('.side-button').css('background-color', 'transparent')
              ag.css('background-color', '#1d1d1d')
            } else {
              B = 'negado'
              C = 'ERRO!'
              D = 'Sem permissão.'
              E()
            }
          }
        )
      })
      $('#players').click(function () {
        a8 = 'players'
        const ae = { action: a8 }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ae),
          (af) => {
            let aj = af.isAllowed
            if (aj) {
              var ah = $(this)
              $('.begin-content').hide()
              $('.groups-content').hide()
              $('.items-content').hide()
              $('.vehicles-content').hide()
              $('.economy-content').hide()
              $('.whitelist-content').hide()
              $('.playerlist-content').fadeIn(750)
              F()
              $('.side-button').css('background-color', 'transparent')
              ah.css('background-color', '#1d1d1d')
            } else {
              B = 'negado'
              C = 'ERRO!'
              D = 'Sem permissão.'
              E()
            }
          }
        )
      })
      $('#economy').click(function () {
        a8 = 'money'
        const ad = { action: a8 }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ad),
          (ae) => {
            let ah = ae.isAllowed
            if (ah) {
              var af = $(this)
              $('.begin-content').hide()
              $('.groups-content').hide()
              $('.items-content').hide()
              $('.vehicles-content').hide()
              $('.playerlist-content').hide()
              $('.whitelist-content').hide()
              $('.economy-content').fadeIn(750)
              L()
              K()
              $('.side-button').css('background-color', 'transparent')
              af.css('background-color', '#1d1d1d')
            } else {
              ;(B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E()
            }
          }
        )
      })
      $('#whitelist').click(function () {
        a8 = 'wl_manage'
        const ae = { action: a8 }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ae),
          (af) => {
            let aj = af.isAllowed
            if (aj) {
              var ah = $(this)
              $('.begin-content').hide()
              $('.groups-content').hide()
              $('.items-content').hide()
              $('.vehicles-content').hide()
              $('.playerlist-content').hide()
              $('.economy-content').hide()
              H()
              $('.whitelist-content').fadeIn(750)
              $('.side-button').css('background-color', 'transparent')
              ah.css('background-color', '#1d1d1d')
            } else {
              B = 'negado'
              C = 'ERRO!'
              D = 'Sem permissão.'
              E()
            }
          }
        )
      })
      $('#notify').click(function () {
        $('.notify-submit-button').off()
        $('#notify-next').off()
        a8 = 'notify'
        const ae = { action: a8 }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ae),
          (af) => {
            let ah = af.isAllowed
            ah
              ? ($('.notify-bg').fadeIn(),
                (m = true),
                $('.notify-submit-button').click(function () {
                  let aj = $('#notify-player-message').val(),
                    ak = $('#signature').val(),
                    al = document.getElementById('isSpecified')
                  const am = {
                    specified: false,
                    id: null,
                    message: aj,
                    signature: ak,
                  }
                  !al.checked
                    ? ($.post(
                        'http://skips_admin/AdminNotify',
                        JSON.stringify(am)
                      ),
                      $('.notify-bg').fadeOut(),
                      (m = false),
                      $('#notify-player-message').val(''),
                      $('#signature').val(''),
                      $('.notify-submit-button').off())
                    : ($('.notify-target-bg').fadeIn(),
                      (n = true),
                      $('#notify-next').click(function () {
                        let an = $('#target-id').val()
                        const ao = {
                          specified: true,
                          id: an,
                          message: aj,
                          signature: ak,
                        }
                        $.post(
                          'http://skips_admin/AdminNotify',
                          JSON.stringify(ao)
                        )
                        $('.notify-target-bg').fadeOut()
                        $('.notify-bg').fadeOut()
                        m = false
                        n = false
                        document.getElementById('isSpecified').checked = false
                        $('.notify-submit-button').off()
                        $('#notify-next').off()
                        $('#target-id').val('')
                        $('#notify-player-message').val('')
                        $('#signature').val('')
                      }))
                }))
              : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
          }
        )
        $('.notify-back-button').click(function () {
          $('.notify-bg').fadeOut()
          m = false
        })
      })
      $('#coordinates').click(function () {
        a8 = 'coordinates'
        const ae = { action: a8 }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ae),
          (af) => {
            let ah = af.isAllowed
            ah
              ? $.post(
                  'http://skips_admin/GetPlayerCoords',
                  JSON.stringify({}),
                  (ai) => {
                    z()
                    let al = ai.coords
                    $('.input-box-title p').text(
                      'Copie com CTRL + A e CTRL + C:'
                    )
                    $('#input-value').val(al + ", ['h'] = " + ai.heading)
                    $('#text-input-confirm').click(function () {
                      A()
                    })
                    $('#text-input-cancel').click(function () {
                      A()
                    })
                  }
                )
              : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
          }
        )
      })
      $('#yrevive').click(function () {
        a8 = 'revive'
        const ac = { action: a8 }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ac),
          (ad) => {
            let ae = ad.isAllowed
            const af = { id: null }
            ae
              ? ($.post('http://skips_admin/yrevive', JSON.stringify(af)),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D = 'Você se reviveu'),
                E())
              : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
          }
        )
      })
      $('#ykill').click(function () {
        a8 = 'kill'
        const ae = { action: a8 }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ae),
          (af) => {
            let ah = af.isAllowed
            ah
              ? ($.post('http://skips_admin/ykill', JSON.stringify({})),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D = 'Você se matou'),
                E())
              : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
          }
        )
      })
      let a9 = '',
        aa = false
      function ab() {
        ;(o = true),
          $('.tp-action-input').off(),
          $('.teleport-bg').fadeIn(),
          $('.tp-action-input').click(function () {
            aa
              ? ((aa = false), $('.tp-action-options').slideUp(100))
              : ((aa = true), $('.tp-action-options').slideDown(100))
          }),
          $('.tp-close-button').click(function () {
            $('.teleport-bg').fadeOut()
            o = false
            $('#idtome-input').val('')
            $('#tpto-input').val('')
          })
      }
      $('#teleport').click(function () {
        a8 = 'teleport'
        const ae = { action: a8 }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ae),
          (af) => {
            let ah = af.isAllowed
            ah
              ? (ab(),
                $('#tp-to-id').click(function () {
                  a9 = 'tp_to_id'
                  $('.tp-action-input p').text('TP para Jogador')
                  $('.tp-action-options').hide()
                  aa = false
                  a9 == 'tp_to_id' &&
                    ($('.tp-submit-button').off(),
                    $('.tp-submit-button').stop().fadeTo(250, 1),
                    $('#tp-action-content').empty(),
                    $('#tp-action-content').html(
                      '\n                                <div class="tpto-container"> \n                                    <div class="tpto-title"> \n                                        <p> Ir até Jogador </p> \n                                    </div>\n                                    <div class="tpto-input">\n                                        <input type="text" placeholder="Digite o ID..." id="tpto-input">\n                                    </div>\n                                </div>\n                            '
                    ),
                    $('.tp-submit-button').click(function () {
                      let aj = $('#tpto-input').val()
                      !isNaN(aj) && aj != 0
                        ? ($.post(
                            'http://skips_admin/TPToPlayer',
                            JSON.stringify({ id: aj })
                          ),
                          $.post('http://skips_admin/TriggerUI'))
                        : ((B = 'negado'),
                          (C = 'ERRO!'),
                          (D =
                            'Digite um ID válido, utilize apenas caracteres numéricos.'),
                          E())
                      $('#tpto-input').val('')
                      $('.teleport-bg').fadeOut()
                      o = false
                    }))
                }),
                $('#tp-way').click(function () {
                  a9 = 'tp_way'
                  $('.tp-action-input p').text('TP para Waypoint')
                  $('.tp-action-options').hide()
                  $('.tp-submit-button').fadeOut(150)
                  aa = false
                  a9 == 'tp_way' &&
                    ($('#tp-action-content').empty(),
                    $('#tp-action-content').html(
                      '\n                                <div class="tpway-container"> \n                                    <div class="tpway-title"> \n                                        <p> Ir até Waypoint </p> \n                                    </div>\n                                    <div class="tpway-submit">\n                                        <p><i class="fas fa-long-arrow-alt-right"></i> IR ! </p>\n                                    </div>\n                                </div>\n                            '
                    ),
                    $('.tpway-submit').click(function () {
                      $.post('http://skips_admin/TPWay', JSON.stringify({}))
                      $.post('http://skips_admin/TriggerUI')
                      $('.teleport-bg').fadeOut()
                      o = false
                    }))
                }),
                $('#id-tp-to').click(function () {
                  a9 = 'id_tp_to'
                  $('.tp-action-input p').text('Puxar Jogador')
                  $('.tp-action-options').hide()
                  aa = false
                  a9 == 'id_tp_to' &&
                    ($('.tp-submit-button').off(),
                    $('.tp-submit-button').stop().fadeTo(250, 1),
                    $('#tp-action-content').empty(),
                    $('#tp-action-content').html(
                      '\n                            <div class="tpto-container"> \n                                <div class="tpto-title"> \n                                    <p> Puxar Jogador </p> \n                                </div>\n                                <div class="tpto-input">\n                                    <input type="text" placeholder="Digite o ID..." id="idtome-input">\n                                </div>\n                             </div>\n                            '
                    ),
                    $('.tp-submit-button').click(function () {
                      let al = $('#idtome-input').val()
                      !isNaN(al) && al != 0
                        ? ($.post(
                            'http://skips_admin/TeleportToMe',
                            JSON.stringify({ id: al })
                          ),
                          $.post('http://skips_admin/TriggerUI'))
                        : ((B = 'negado'),
                          (C = 'ERRO!'),
                          (D =
                            'Digite um ID válido, utilize apenas caracteres numéricos.'),
                          E())
                      $('#idtome-input').val('')
                      $('.teleport-bg').fadeOut()
                      o = false
                    }))
                }))
              : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão.'), E())
          }
        )
      })
      $('#takeweapons').click(function () {
        $('.clear-weapons').off()
        action = 'weapons'
        const ae = { action: action }
        $.post(
          'http://skips_admin/checkManagementPerm',
          JSON.stringify(ae),
          (af) => {
            let ai = af.isAllowed
            ai
              ? ($('.take-weapon-btn').off('click'),
                $('.takeweapons-bg').fadeIn(),
                (Q = true),
                u(),
                $('#melee').click(function () {
                  var ak = $(this)
                  P = 'melee'
                  u()
                  $('.weapon-category').css('background-color', 'white')
                  ak.css('background-color', '#b9b9b9')
                }),
                $('#handgun').click(function () {
                  var ak = $(this)
                  P = 'handgun'
                  u()
                  $('.weapon-category').css('background-color', 'white')
                  ak.css('background-color', '#b9b9b9')
                }),
                $('#submachine').click(function () {
                  var aj = $(this)
                  P = 'submachine'
                  u()
                  $('.weapon-category').css('background-color', 'white')
                  aj.css('background-color', '#b9b9b9')
                }),
                $('#assault').click(function () {
                  var ak = $(this)
                  P = 'assault'
                  u()
                  $('.weapon-category').css('background-color', 'white')
                  ak.css('background-color', '#b9b9b9')
                }),
                $('#shotgun').click(function () {
                  var ak = $(this)
                  P = 'shotgun'
                  u()
                  $('.weapon-category').css('background-color', 'white')
                  ak.css('background-color', '#b9b9b9')
                }),
                $('#throwable').click(function () {
                  var ak = $(this)
                  P = 'throwable'
                  u()
                  $('.weapon-category').css('background-color', 'white')
                  ak.css('background-color', '#b9b9b9')
                }),
                $('#rifle').click(function () {
                  var aj = $(this)
                  P = 'rifle'
                  u()
                  $('.weapon-category').css('background-color', 'white')
                  aj.css('background-color', '#b9b9b9')
                }),
                $('#special').click(function () {
                  var ak = $(this)
                  P = 'special'
                  u()
                  $('.weapon-category').css('background-color', 'white')
                  ak.css('background-color', '#b9b9b9')
                }),
                $('#all').click(function () {
                  var aj = $(this)
                  P = 'all'
                  u()
                  $('.weapon-category').css('background-color', 'white')
                  aj.css('background-color', '#b9b9b9')
                }))
              : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
          }
        )
        $(document).on('click', '.take-weapon-btn', function () {
          $('.wp-ammo-amount-confirm-button').off()
          let ag = $(this),
            ah = ag.attr('data-name-key'),
            ai = ag.attr('data-name-name'),
            aj = ag.attr('data-name-type')
          aj.toString() != 'melee'
            ? ($('.wp-ammo-amount-bg').fadeIn(),
              document.getElementById('wp-ammo-amount').focus(),
              (R = true),
              $('.wp-confirm-button').click(function () {
                let ak = $('#wp-ammo-amount').val()
                ak == 0 && (ak = 250)
                !isNaN(ak)
                  ? ($.post(
                      'http://skips_admin/giveWeaponToPlayer',
                      JSON.stringify({
                        weapon: ah,
                        id: null,
                        ammo: ak,
                      })
                    ),
                    $('.wp-ammo-amount-bg').fadeOut(),
                    $('#wp-ammo-amount').val(''),
                    (B = 'sucesso'),
                    (C = 'SUCESSO!'),
                    (D = 'Você adicionou ' + ai + ' na roda de armas.'),
                    E(),
                    (R = false))
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                    E(),
                    $('.wp-ammo-amount-bg').fadeOut(),
                    $('#wp-ammo-amount').val(''))
              }),
              $('#wp-ammo-cancel').click(function () {
                $('.wp-ammo-amount-bg').fadeOut()
                R = false
              }))
            : ($('.cb-main-text span').text('PEGAR ' + ai),
              v(),
              (R = true),
              $('#confirm-box-confirm').click(function () {
                const am = {
                  weapon: ah,
                  id: null,
                  ammo: 1,
                }
                $.post('http://skips_admin/giveWeaponToPlayer', JSON.stringify(am))
                $('.success-text span').text(
                  'Você adicionou ' + ai + ' na sua roda de armas.'
                )
                x()
                R = false
              }),
              $('#confirm-box-cancel').click(function () {
                w()
                R = false
              }))
        })
        $('.clear-weapons').click(function () {
          const ai = {}
          ai.id = null
          $.post('http://skips_admin/clearPlayerWeapons', JSON.stringify(ai))
          B = 'sucesso'
          C = 'SUCESSO!'
          D = 'Você limpou sua roda de armas.'
          E()
        })
      })
    },
    u = () => {
      const a8 = { type: P }
      $.post('http://skips_admin/requestWeapons', JSON.stringify(a8), (a9) => {
        var ab = a9.weapons.sort()
        $('#wpcontainer').html(
          '\n                ' +
            ab
              .map(
                (ad) =>
                  '\n                    <div class="weapon-model" data-name-key="' +
                  ad.weapon_id +
                  '" data-name-name="' +
                  ad.weapon_name +
                  '" data-name-type="' +
                  ad.weapon_type +
                  '">\n                        <div class="weapon-name"> ' +
                  ad.weapon_name +
                  ' </div>\n                        <div class="weapon-image"><img src="' +
                  ad.weapon_directory +
                  '/' +
                  ad.weapon_name +
                  '.png"></div>\n                    \n                        <div class="take-weapon-btn" data-name-key="' +
                  ad.weapon_id +
                  '" data-name-name="' +
                  ad.weapon_name +
                  '" data-name-type="' +
                  ad.weapon_type +
                  '"> </p> Pegar </p> </div>\n                    </div>\n                '
              )
              .join('') +
            '\n            '
        )
      })
    }
  $(document).ready(function () {
    $('#wpsearch').on('keyup', function () {
      var a7 = $(this).val().toLowerCase()
      $('.weapon-model').filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(a7) > -1)
      })
    })
  })
  function v() {
    $('#confirm-box-confirm').off()
    $('.confirm-box-display').fadeIn()
    setTimeout(function () {
      $('.confirm-box').css('margin-top', '20vh')
    }, 250)
    l = true
  }
  function w() {
    $('#confirm-box-confirm').off()
    $('.confirm-box').css('margin-top', '-65vh')
    setTimeout(function () {
      $('.confirm-box-display').fadeOut(150)
    }, 1500)
    l = false
  }
  function x() {
    $('.cb-header-content').fadeOut()
    setTimeout(function () {
      $('.confirm-success').fadeIn(),
        $('.confirm-box-header').css(
          'background',
          "url('https://cdn.discordapp.com/attachments/852408669890281512/854036426457874492/bg-success.png')"
        ),
        setTimeout(function () {
          $('.ok-button').fadeTo('slow', 1)
        }, 1200),
        $('.check_mark').fadeIn(),
        $('.ok-button').click(function () {
          $('.confirm-box').css('margin-top', '-65vh'),
            setTimeout(function () {
              $('.confirm-box-display').fadeOut(150),
                $('.confirm-box-header').css(
                  'background',
                  "url('https://cdn.discordapp.com/attachments/852408669890281512/852819114891804682/bg2.png')"
                )
            }, 1500),
            (l = false),
            $('.confirm-success').fadeOut(),
            $('.ok-button').fadeOut(),
            setTimeout(function () {
              $('.cb-header-content').fadeIn()
            }, 1600)
        })
    }, 400)
  }
  function y() {
    $('.cb-header-content').fadeOut()
    setTimeout(function () {
      $('.confirm-fail').fadeIn()
      $('.confirm-box-header').css(
        'background',
        "url('https://cdn.discordapp.com/attachments/852408669890281512/853998367096307743/bg-error.png')"
      )
      setTimeout(function () {
        $('.ok-button').fadeTo('slow', 1)
      }, 2000)
      $('.check_mark').fadeIn()
      $('.ok-button').click(function () {
        $('.confirm-box').css('margin-top', '-65vh'),
          setTimeout(function () {
            $('.confirm-box-display').fadeOut(150)
            $('.confirm-box-header').css(
              'background',
              "url('https://cdn.discordapp.com/attachments/852408669890281512/852819114891804682/bg2.png')"
            )
          }, 1500),
          (l = false),
          $('.confirm-fail').fadeOut(),
          $('.ok-button').fadeOut(),
          setTimeout(function () {
            $('.cb-header-content').fadeIn()
          }, 1600)
      })
    }, 400)
  }
  function z() {
    $('#text-input-confirm').off()
    $('.input-background').fadeIn()
    k = true
    document.getElementById('input-value').focus()
  }
  function A() {
    $('.input-background').fadeOut()
    k = false
  }
  var B = '',
    C = '',
    D = ''
  function E() {
    var a7 =
      "<div class='otdv-nt notify-outerdiv-" +
      B +
      "' style='background: #fff; color: #272626'> <i class='fas fa-times'></i> <div class='notify-icon-" +
      B +
      "'> </div> <div class='notify-title'> <p><b> " +
      C +
      " </b></p> </div> <div class='notify-message'> <p> " +
      D +
      ' </p>  </div>'
    $(a7)
      .hide()
      .fadeTo('fast', 1)
      .appendTo('#notifications')
      .delay(5000)
      .fadeTo('fast', 0)
      .delay(170)
      .fadeOut()
    $(document).on('click', '.otdv-nt i', function () {
      $('.otdv-nt').hide()
    })
  }
  const F = () => {
      $.post('http://skips_admin/requestPlayers', JSON.stringify({}), (a8) => {
        var aa = (aa = a8.players.sort((ac, ad) =>
          ac.uname > ad.uname ? 1 : -1
        ))
        M == 'az-by-id'
          ? (aa = a8.players.sort((ac, ad) => parseInt(ac.k) - parseInt(ad.k)))
          : (aa = a8.players.sort((ac, ad) => (ac.uname > ad.uname ? 1 : -1)))
        let ab = 0
        $('#online-players').html(
          '\n                <div class="playerlist-infos">\n                    <div class="gp-info pl-id-tit"> <b><p> ID </p> </div>\n                    <div class="gp-info pl-name-tit"> <p> Nome </p></b> </div>\n                </div>\n                ' +
            aa
              .map(
                (ac) =>
                  '\n                    <div class="playerlist-model" data-id="' +
                  ac.k +
                  '" data-name="' +
                  ac.uname +
                  '" data-last-name="' +
                  ac.ulname +
                  '">\n                        <div class="player-id"> <b> ' +
                  ac.k +
                  ' </b></div>\n                        <div class="player-name"> ' +
                  ac.uname +
                  ' ' +
                  ac.ulname +
                  ' </div>\n                        <div style="display: none;">' +
                  (ab = ab + 1) +
                  '</div>\n                    </div>\n                '
              )
              .join('') +
            '\n            '
        )
        $('.online-amount').html(
          '<p> Online: ' + ab + ' <i class="fas fa-circle"></i> </p>'
        )
      })
    },
    G = () => {
      $.post('http://skips_admin/GetLogs', JSON.stringify({}), (a7) => {
        var a9 = a7.all_logs.sort((ab, ac) => ab.date - ac.date)
        $('#logs-main').html(
          '\n                ' +
            a9
              .map(
                (ab) =>
                  '\n                    <div class="log-model" data-log_id="' +
                  ab.log_id +
                  '">\n                        <div class="user-id logs"> <b> ID ' +
                  ab.u_id +
                  ' </b></div>\n                        <div class="user-name logs"> ' +
                  ab.u_name +
                  '</div>\n                        <div class="spec-log logs"> <b> ' +
                  ab.log +
                  ' </b></div>\n                        <div class="log-data logs"> ' +
                  ab.data +
                  '</div>\n                        <div class="log-hour logs"> ' +
                  ab.hour +
                  '</div>\n                    </div>\n                '
              )
              .join('') +
            '\n            '
        )
      })
    }
  $(document).ready(function () {
    $('#logs-search').on('keyup', function () {
      var a9 = $(this).val().toLowerCase()
      $('.log-model').filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(a9) > -1)
      })
    })
  })
  $('#open-logs').click(function () {
    left_action = 'see_logs'
    const a8 = { action: left_action }
    $.post('http://skips_admin/checkManagementPerm', JSON.stringify(a8), (a9) => {
      let ac = a9.isAllowed
      ac
        ? ($('.config-display').fadeOut(),
          (j = false),
          G(),
          $('.logs-bg').fadeIn(),
          (p = true),
          (left_action = 'edit_logs'),
          $.post(
            'http://skips_admin/checkManagementPerm',
            JSON.stringify({ action: left_action }),
            (ad) => {
              let af = ad.isAllowed
              af
                ? ($('.logs-remove-button').show(),
                  $('.logs-remove-all-button').show())
                : ($('.logs-remove-button').hide(),
                  $('.logs-remove-all-button').hide())
            }
          ))
        : ((B = 'negado'),
          (C = 'ERRO!'),
          (D = 'Sem permissão'),
          E(),
          $('.config-display').fadeOut(),
          (j = false))
    })
  })
  $(document).on('click', '.log-model', function () {
    left_action = 'edit_logs'
    const a8 = { action: left_action }
    $.post('http://skips_admin/checkManagementPerm', JSON.stringify(a8), (a9) => {
      let ac = a9.isAllowed
      if (ac) {
        let ad = $(this),
          ae = ad.hasClass('active')
        $('.log-model').removeClass('active')
        !ae && ad.addClass('active')
      }
    })
  })
  $('.logs-remove-button').click(function () {
    let a7 = $('.log-model.active'),
      a8 = a7.attr('data-log_id')
    a8
      ? (i.checked
          ? (v(), $('.cb-main-text span').text('APAGAR REGISTRO'))
          : ($.post('http://skips_admin/eraseLog', JSON.stringify({ id: a8 })),
            (B = 'sucesso'),
            (C = 'SUCESSO!'),
            (D = 'Você apagou o registro selecionado.'),
            E(),
            G()),
        $('#confirm-box-cancel').click(function () {
          w()
        }),
        $('#confirm-box-confirm').click(function () {
          const ab = { id: a8 }
          $.post('http://skips_admin/eraseLog', JSON.stringify(ab))
          $('.success-text span').text('Você apagou o registro selecionado.')
          x()
          G()
        }))
      : ((B = 'negado'),
        (C = 'ERRO!'),
        (D = 'Selecione um registro para apagar'),
        E(),
        $('.logs-bg').fadeOut(),
        (p = false))
  })
  $('.logs-remove-all-button').click(function () {
    i.checked
      ? (v(), $('.cb-main-text span').text('APAGAR TODOS OS REGISTROS'))
      : ($.post('http://skips_admin/eraseAllLogs', JSON.stringify({})),
        (B = 'sucesso'),
        (C = 'SUCESSO!'),
        (D = 'Você apagou todos os registros.'),
        E(),
        G())
    $('#confirm-box-cancel').click(function () {
      w()
    })
    $('#confirm-box-confirm').click(function () {
      $.post('http://skips_admin/eraseAllLogs', JSON.stringify({}))
      $('.success-text span').text('Você apagou todos os registros.')
      x()
      G()
    })
  })
  $('.logs-close-button').click(function () {
    $('.logs-bg').fadeOut()
    p = false
  })
  $(document).ready(function () {
    $('#whitelist-search').on('keyup', function () {
      var a8 = $(this).val().toLowerCase()
      $('.whitelist-model').filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(a8) > -1)
      })
    })
  })
  const H = () => {
    $.post('http://skips_admin/GetWhitelisted', JSON.stringify({}), (a7) => {
      var a8 = a7.whitelisted.sort(
        (a9, aa) => parseInt(a9.u_id) - parseInt(aa.u_id)
      )
      $('#whitelist-main').html(
        '\n                ' +
          a8
            .map(
              (a9) =>
                '\n                    <div class="whitelist-model" data-id="' +
                a9.u_id +
                '" data-wlstate="' +
                a9.wlstate +
                '">\n                        <div class="user-id whitelist"> <b> ID [ ' +
                a9.u_id + ' ]' +
                ' </b></div>\n                        <div class="wl-state whitelist"> ' +
                a9.wlstate +
                '</div>\n                    </div>\n                '
            )
            .join('') +
          '\n            '
      )
    })
    $.post('http://skips_admin/GetNonWhitelisted', JSON.stringify({}), (a7) => {
      var a8 = a7.non_whitelisted.sort(
        (aa, ab) => parseInt(aa.u_id) - parseInt(ab.u_id)
      )
      $('#non-whitelist-main').html(
        '\n                ' +
          a8
            .map(
              (aa) =>
                '\n                    <div class="whitelist-model" data-id="' +
                aa.u_id +
                '" data-wlstate="' +
                aa.wlstate +
                '">\n                        <div class="user-id whitelist"> <b> ID [ ' +
                aa.u_id + ' ]' +
                ' </b></div>\n                        <div class="wl-state whitelist"> ' +
                aa.wlstate +
                '</div>\n                    </div>\n                '
            )
            .join('') +
          '\n            '
      )
    })
  }
  $(document).on('click', '.whitelist-model', function () {
    let a6 = $(this),
      a7 = a6.hasClass('active')
    $('.whitelist-model').removeClass('active')
    !a7 && a6.addClass('active')
  })
  $('#add-whitelist').click(function () {
    let a7 = $('.whitelist-model.active'),
      a8 = a7.attr('data-id'),
      a9 = a7.attr('data-wlstate')
    a8 != undefined
      ? i.checked
        ? ($('.cb-main-text span').text(
            'ADICIONAR WHITELIST - ID ' + a8.toString()
          ),
          v(),
          $('#confirm-box-cancel').click(function () {
            w()
          }),
          $('#confirm-box-confirm').click(function () {
            a9 != 'Sim'
              ? ($('.success-text span').text(
                  'Você adicionou o ID ' + a8.toString() + ' a whitelist.'
                ),
                x(),
                setTimeout(function () {
                  H()
                }, 500),
                $.post('http://skips_admin/addwl', JSON.stringify({ id: a8 })))
              : ($('.fail-text span').text(
                  'O ID ' + a8.toString() + ' já está na whitelist.'
                ),
                y())
          }))
        : ((B = 'sucesso'),
          (C = 'SUCESSO!'),
          (D = 'Você adicionou o ID ' + a8.toString() + ' a whitelist.'),
          E(),
          setTimeout(function () {
            H()
          }, 500),
          $.post('http://skips_admin/addwl', JSON.stringify({ id: a8 })))
      : ($('.input-box-title p').text('Digite abaixo o ID:'),
        z(),
        $('#text-input-confirm').click(function () {
          var ab = $('#input-value').val()
          !isNaN(ab)
            ? (setTimeout(function () {
                H()
              }, 500),
              $.post('http://skips_admin/addwl', JSON.stringify({ id: ab })),
              (B = 'sucesso'),
              (C = 'SUCESSO!'),
              (D =
                'Você adicionou o ID nº ' +
                document.getElementsByName('input-text')[0].value +
                ' a whitelist'),
              E(),
              A())
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
              E(),
              A())
        }))
  })
  $('#rem-whitelist').click(function () {
    let a7 = $('.whitelist-model.active'),
      a8 = a7.attr('data-id'),
      a9 = a7.attr('data-wlstate')
    a7 &&
      (a8 != undefined
        ? (i.checked
            ? ($('.cb-main-text span').text(
                'REMOVER DA WHITELIST - ID ' + a8.toString()
              ),
              v())
            : a9 != 'Não'
            ? ((B = 'sucesso'),
              (C = 'SUCESSO!'),
              (D = 'Você removeu o ID ' + a8.toString() + ' da whitelist.'),
              E(),
              $.post('http://skips_admin/removewl', JSON.stringify({ id: a8 })),
              setTimeout(function () {
                H()
              }, 500))
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'O ID ' + a8.toString() + ' não está na whitelist.'),
              E()),
          $('#confirm-box-cancel').click(function () {
            w()
          }),
          $('#confirm-box-confirm').click(function () {
            a9 != 'Não'
              ? ($('.success-text span').text(
                  'Você removeu o ID ' + a8.toString() + ' da whitelist.'
                ),
                x(),
                $.post('http://skips_admin/removewl', JSON.stringify({ id: a8 })),
                setTimeout(function () {
                  H()
                }, 500))
              : ($('.fail-text span').text(
                  'O ID ' + a8.toString() + ' não está na whitelist.'
                ),
                y())
          }))
        : ($('.input-box-title p').text('Digite abaixo o ID:'),
          z(),
          $('#text-input-confirm').click(function () {
            var ab = $('#input-value').val()
            !isNaN(ab)
              ? ($.post('http://skips_admin/removewl', JSON.stringify({ id: ab })),
                setTimeout(function () {
                  H()
                }, 500),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D =
                  'Você removeu o ID nº ' +
                  document.getElementsByName('input-text')[0].value +
                  ' da whitelist'),
                E(),
                A())
              : ((B = 'negado'),
                (C = 'ERRO!'),
                (D =
                  'Digite um ID válido, utilize apenas caracteres numéricos.'),
                E(),
                A())
          })))
  })
  let I = false,
    J = ''
  $('.mn-input-sort').click(function () {
    ;(I = !I),
      I ? $('.mn-sort-options').slideDown() : $('.mn-sort-options').slideUp()
  })
  $('#mn-sort-identifier').click(function () {
    J = 'sort-identifier'
    K()
    $('.mn-input-sort p').text('1-10 Identif.')
    $('.mn-sort-options').hide()
    I = false
  })
  $('#mn-sort-wallet').click(function () {
    J = 'sort-wallet'
    K()
    $('.mn-input-sort p').text('1-10 Carte.')
    $('.mn-sort-options').hide()
    I = false
  })
  $('#mn-sort-bank').click(function () {
    J = 'sort-bank'
    K()
    $('.mn-input-sort p').text('1-10 Banco')
    $('.mn-sort-options').hide()
    I = false
  })
  $('#mn-sort-total').click(function () {
    J = 'sort-total'
    $('.mn-input-sort p').text('1-10 Total')
    $('.mn-sort-options').hide()
    I = false
    K()
  })
  const K = () => {
    $.post('http://skips_admin/GetMoneyList', JSON.stringify({}), (a7) => {
      var a9 = a7.moneys.sort((ab, ac) => parseInt(ab.u_id) - parseInt(ac.u_id))
      if (J == 'sort-identifier') {
        a7.moneys.sort((ab, ac) => parseInt(ab.u_id) - parseInt(ac.u_id))
      } else {
        if (J == 'sort-wallet') {
          a7.moneys.sort((ae, af) => parseInt(ae.wallet) - parseInt(af.wallet))
        } else {
          if (J == 'sort-bank') {
            a7.moneys.sort((ag, ah) => parseInt(ag.bank) - parseInt(ah.bank))
          } else {
            J == 'sort-total' &&
              a7.moneys.sort(
                (ah, ai) => parseInt(ah.total) - parseInt(ai.total)
              )
          }
        }
      }
      $('#money-main').html(
        '\n                ' +
          a9
            .map(
              (ah) =>
                '\n                    <div class="moneylist-model" data-id="' +
                ah.u_id +
                '" data-wallet="' +
                ah.wallet +
                '" data-bank="' +
                ah.bank +
                '" data-total="' +
                ah.total +
                '">\n                        <div class="user-id moneylist"> <b> ID ' +
                ah.u_id +
                ' </b></div>\n                        <div class="wallet-money moneylist"> R$' +
                ah.wallet +
                '</div>\n                        <div class="bank-money moneylist"> R$' +
                ah.bank +
                '</div>\n                        <div class="bank-money moneylist"> R$' +
                ah.total +
                '</div>\n                    </div>\n                '
            )
            .join('') +
          '\n            '
      )
    })
  }
  $('#self-addbank').click(function () {
    $.post(
      'http://skips_admin/checkManagementPerm',
      JSON.stringify({ action: 'money' }),
      (a7) => {
        let a9 = a7.isAllowed
        a9 &&
          (z(),
          $('.input-box-title p').text('Digite abaixo a quantidade:'),
          $('#text-input-confirm').click(function () {
            let ac = $('#input-value').val()
            !isNaN(ac)
              ? ($.post(
                  'http://skips_admin/GiveMoney',
                  JSON.stringify({
                    place: 'bank',
                    id: null,
                    amount: ac,
                  })
                ),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D = 'Você adicionou $' + ac.toString() + ' para si mesmo.'),
                E(),
                A())
              : ((B = 'negado'),
                (C = 'ERRO!'),
                (D =
                  'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                E(),
                A())
          }))
      }
    )
  })
  $('#self-addwallet').click(function () {
    let a7 = 'money'
    const a8 = { action: a7 }
    $.post('http://skips_admin/checkManagementPerm', JSON.stringify(a8), (a9) => {
      let ab = a9.isAllowed
      ab &&
        (z(),
        $('.input-box-title p').text('Digite abaixo a quantidade:'),
        $('#text-input-confirm').click(function () {
          let ad = $('#input-value').val()
          !isNaN(ad)
            ? ($.post(
                'http://skips_admin/GiveMoney',
                JSON.stringify({
                  place: 'wallet',
                  id: null,
                  amount: ad,
                })
              ),
              (B = 'sucesso'),
              (C = 'SUCESSO!'),
              (D = 'Você adicionou $' + ad.toString() + ' para si mesmo.'),
              E(),
              A())
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D =
                'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
              E(),
              A())
        }))
    })
  })
  $('#self-setbank').click(function () {
    let a7 = 'money'
    const a8 = { action: a7 }
    $.post('http://skips_admin/checkManagementPerm', JSON.stringify(a8), (a9) => {
      let ab = a9.isAllowed
      ab &&
        (z(),
        $('.input-box-title p').text('Digite abaixo a quantidade:'),
        $('#text-input-confirm').click(function () {
          let ad = $('#input-value').val()
          !isNaN(ad)
            ? ($.post(
                'http://skips_admin/SetMoney',
                JSON.stringify({
                  place: 'bank',
                  id: null,
                  amount: ad,
                })
              ),
              (B = 'sucesso'),
              (C = 'SUCESSO!'),
              (D =
                'Você definiu R$' +
                ad.toString() +
                ' para si mesmo na carteira.'),
              E(),
              A())
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D =
                'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
              E(),
              A())
        }))
    })
  })
  $('#self-setwallet').click(function () {
    $.post(
      'http://skips_admin/checkManagementPerm',
      JSON.stringify({ action: 'money' }),
      (a8) => {
        let ab = a8.isAllowed
        ab &&
          (z(),
          $('.input-box-title p').text('Digite abaixo a quantidade:'),
          $('#text-input-confirm').click(function () {
            let ad = $('#input-value').val()
            !isNaN(ad)
              ? ($.post(
                  'http://skips_admin/SetMoney',
                  JSON.stringify({
                    place: 'wallet',
                    id: null,
                    amount: ad,
                  })
                ),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D =
                  'Você definiu R$' +
                  ad.toString() +
                  ' para si mesmo na carteira.'),
                E(),
                A())
              : ((B = 'negado'),
                (C = 'ERRO!'),
                (D =
                  'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                E(),
                A())
          }))
      }
    )
  })
  $(document).on('click', '.moneylist-model', function () {
    let a7 = $(this),
      a8 = a7.hasClass('active')
    $('.moneylist-model').removeClass('active')
    if (!a8) {
      let aa = a7.attr('data-id'),
        ab = a7.attr('data-wallet'),
        ac = a7.attr('data-bank'),
        ad = a7.attr('data-total')
      const ae = { id: aa }
      $.post('http://skips_admin/GetPlayerInfos', JSON.stringify(ae), (af) => {
        let ag = af.name,
          ah = af.lastname
        ag && ah != undefined
          ? $('#pld-name span').text(ag + ' ' + ah)
          : $('#pld-name span').text('Não Encontrado.')
        $('#pld-uid span').text('ID ' + aa)
        $('#pld-wallet span').text('R$ ' + ab)
        $('#pld-bank span').text('R$ ' + ac)
        $('#pld-total span').text('R$ ' + ad)
      })
      a7.addClass('active')
    } else {
      L()
    }
  })
  $('#ot-addbank').click(function () {
    let a7 = $('.moneylist-model.active'),
      a8 = a7.attr('data-id')
    a8 != undefined
      ? $.post(
          'http://skips_admin/CheckOnlinePlayer',
          JSON.stringify({ id: a8 }),
          (a9) => {
            let ac = a9.state
            ac
              ? (z(),
                $('.input-box-title p').text('Digite abaixo a quantidade:'),
                $('#text-input-confirm').click(function () {
                  let ae = $('#input-value').val()
                  !isNaN(ae)
                    ? ($.post(
                        'http://skips_admin/GiveMoney',
                        JSON.stringify({
                          id: a8,
                          amount: ae,
                          place: 'bank',
                        })
                      ),
                      (B = 'sucesso'),
                      (C = 'SUCESSO!'),
                      (D =
                        'Você adicionou $' +
                        ae.toString() +
                        ' para o ID ' +
                        a8.toString() +
                        ' no banco.'),
                      E(),
                      A())
                    : ((B = 'negado'),
                      (C = 'ERRO!'),
                      (D =
                        'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                      E(),
                      A())
                }))
              : ((B = 'negado'),
                (C = 'ERRO!'),
                (D = 'ID indisponível (não existente ou offline).'),
                E(),
                A())
          }
        )
      : (z(),
        $('.input-box-title p').text('Digite abaixo o ID:'),
        $('#text-input-confirm').click(function () {
          let ab = $('#input-value').val()
          !isNaN(ab) && ab != 0
            ? (A(),
              z(),
              setTimeout(function () {
                $('.input-box-title p').text('Digite abaixo a quantidade:')
              }, 400),
              $('#text-input-confirm').click(function () {
                let ad = $('#input-value').val()
                !isNaN(ad)
                  ? $.post(
                      'http://skips_admin/TryGiveMoney',
                      JSON.stringify({
                        id: ab,
                        amount: ad,
                        place: 'bank',
                      }),
                      (ae) => {
                        let ah = ae.state
                        ah
                          ? ((B = 'sucesso'),
                            (C = 'SUCESSO!'),
                            (D =
                              'Você adicionou $' +
                              ad.toString() +
                              ' para o ID ' +
                              ab.toString() +
                              ' no banco.'),
                            E(),
                            A())
                          : ((B = 'negado'),
                            (C = 'ERRO!'),
                            (D = 'ID indisponível (não existente ou offline).'),
                            E(),
                            A())
                      }
                    )
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                    E(),
                    A())
              }))
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
              E(),
              A())
        }))
  })
  $('#ot-setbank').click(function () {
    let a7 = $('.moneylist-model.active'),
      a8 = a7.attr('data-id')
    a8 != undefined
      ? $.post(
          'http://skips_admin/CheckOnlinePlayer',
          JSON.stringify({ id: a8 }),
          (a9) => {
            let ac = a9.state
            ac
              ? (z(),
                $('.input-box-title p').text('Digite abaixo a quantidade:'),
                $('#text-input-confirm').click(function () {
                  let ad = $('#input-value').val()
                  !isNaN(ad)
                    ? ($.post(
                        'http://skips_admin/SetMoney',
                        JSON.stringify({
                          id: a8,
                          amount: ad,
                          place: 'bank',
                        })
                      ),
                      (B = 'sucesso'),
                      (C = 'SUCESSO!'),
                      (D =
                        'Você definiu $' +
                        ad.toString() +
                        ' para o ID ' +
                        a8.toString() +
                        ' no banco.'),
                      E(),
                      A())
                    : ((B = 'negado'),
                      (C = 'ERRO!'),
                      (D =
                        'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                      E(),
                      A())
                }))
              : ((B = 'negado'),
                (C = 'ERRO!'),
                (D = 'ID indisponível (não existente ou offline).'),
                E(),
                A())
          }
        )
      : (z(),
        $('.input-box-title p').text('Digite abaixo o ID:'),
        $('#text-input-confirm').click(function () {
          let ab = $('#input-value').val()
          !isNaN(ab) && ab != 0
            ? (A(),
              z(),
              setTimeout(function () {
                $('.input-box-title p').text('Digite abaixo a quantidade:')
              }, 400),
              $('#text-input-confirm').click(function () {
                let ae = $('#input-value').val()
                !isNaN(ae)
                  ? $.post(
                      'http://skips_admin/TrySetMoney',
                      JSON.stringify({
                        id: ab,
                        amount: ae,
                        place: 'bank',
                      }),
                      (af) => {
                        let ah = af.state
                        ah
                          ? ((B = 'sucesso'),
                            (C = 'SUCESSO!'),
                            (D =
                              'Você definiu $' +
                              ae.toString() +
                              ' para o ID ' +
                              ab.toString() +
                              ' no banco.'),
                            E(),
                            A())
                          : ((B = 'negado'),
                            (C = 'ERRO!'),
                            (D = 'ID indisponível (não existente ou offline).'),
                            E(),
                            A())
                      }
                    )
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                    E(),
                    A())
              }))
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
              E(),
              A())
        }))
  })
  $('#ot-addwallet').click(function () {
    let a7 = $('.moneylist-model.active'),
      a8 = a7.attr('data-id')
    a8 != undefined
      ? $.post(
          'http://skips_admin/CheckOnlinePlayer',
          JSON.stringify({ id: a8 }),
          (a9) => {
            let aa = a9.state
            aa
              ? (z(),
                $('.input-box-title p').text('Digite abaixo a quantidade:'),
                $('#text-input-confirm').click(function () {
                  let ad = $('#input-value').val()
                  !isNaN(ad)
                    ? ($.post(
                        'http://skips_admin/GiveMoney',
                        JSON.stringify({
                          id: a8,
                          amount: ad,
                          place: 'wallet',
                        })
                      ),
                      (B = 'sucesso'),
                      (C = 'SUCESSO!'),
                      (D =
                        'Você adicionou R$' +
                        ad.toString() +
                        ' para o ID ' +
                        a8.toString() +
                        ' na carteira.'),
                      E(),
                      A())
                    : ((B = 'negado'),
                      (C = 'ERRO!'),
                      (D =
                        'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                      E(),
                      A())
                }))
              : ((B = 'negado'),
                (C = 'ERRO!'),
                (D = 'ID indisponível (não existente ou offline).'),
                E(),
                A())
          }
        )
      : (z(),
        $('.input-box-title p').text('Digite abaixo o ID:'),
        $('#text-input-confirm').click(function () {
          let ab = $('#input-value').val()
          !isNaN(ab) && ab != 0
            ? (A(),
              z(),
              setTimeout(function () {
                $('.input-box-title p').text('Digite abaixo a quantidade:')
              }, 400),
              $('#text-input-confirm').click(function () {
                let ae = $('#input-value').val()
                !isNaN(ae)
                  ? $.post(
                      'http://skips_admin/TryGiveMoney',
                      JSON.stringify({
                        id: ab,
                        amount: ae,
                        place: 'wallet',
                      }),
                      (af) => {
                        let ai = af.state
                        ai
                          ? ((B = 'sucesso'),
                            (C = 'SUCESSO!'),
                            (D =
                              'Você adicionou R$' +
                              ae.toString() +
                              ' para o ID ' +
                              ab.toString() +
                              ' na carteira.'),
                            E(),
                            A())
                          : ((B = 'negado'),
                            (C = 'ERRO!'),
                            (D = 'ID indisponível (não existente ou offline).'),
                            E(),
                            A())
                      }
                    )
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                    E(),
                    A())
              }))
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
              E(),
              A())
        }))
  })
  $('#ot-setwallet').click(function () {
    let a8 = $('.moneylist-model.active'),
      a9 = a8.attr('data-id')
    a9 != undefined
      ? $.post(
          'http://skips_admin/CheckOnlinePlayer',
          JSON.stringify({ id: a9 }),
          (aa) => {
            let ac = aa.state
            ac
              ? (z(),
                $('.input-box-title p').text('Digite abaixo a quantidade:'),
                $('#text-input-confirm').click(function () {
                  let ad = $('#input-value').val()
                  !isNaN(ad)
                    ? ($.post(
                        'http://skips_admin/SetMoney',
                        JSON.stringify({
                          id: a9,
                          amount: ad,
                          place: 'wallet',
                        })
                      ),
                      (B = 'sucesso'),
                      (C = 'SUCESSO!'),
                      (D =
                        'Você definiu R$' +
                        ad.toString() +
                        ' para o ID ' +
                        a9.toString() +
                        ' na carteira.'),
                      E(),
                      A())
                    : ((B = 'negado'),
                      (C = 'ERRO!'),
                      (D =
                        'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                      E(),
                      A())
                }))
              : ((B = 'negado'),
                (C = 'ERRO!'),
                (D = 'ID indisponível (não existente ou offline).'),
                E(),
                A())
          }
        )
      : (z(),
        $('.input-box-title p').text('Digite abaixo o ID:'),
        $('#text-input-confirm').click(function () {
          let ab = $('#input-value').val()
          !isNaN(ab) && ab != 0
            ? (A(),
              z(),
              setTimeout(function () {
                $('.input-box-title p').text('Digite abaixo a quantidade:')
              }, 400),
              $('#text-input-confirm').click(function () {
                let ae = $('#input-value').val()
                !isNaN(ae)
                  ? $.post(
                      'http://skips_admin/TrySetMoney',
                      JSON.stringify({
                        id: ab,
                        amount: ae,
                        place: 'wallet',
                      }),
                      (af) => {
                        let ai = af.state
                        ai
                          ? ((B = 'sucesso'),
                            (C = 'SUCESSO!'),
                            (D =
                              'Você definiu R$' +
                              ae.toString() +
                              ' para o ID ' +
                              ab.toString() +
                              ' na carteira.'),
                            E(),
                            A())
                          : ((B = 'negado'),
                            (C = 'ERRO!'),
                            (D = 'ID indisponível (não existente ou offline).'),
                            E(),
                            A())
                      }
                    )
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                    E(),
                    A())
              }))
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
              E(),
              A())
        }))
  })
  function L() {
    $('#pld-name span').text('Aguardando...')
    $('#pld-uid span').text('Aguardando...')
    $('#pld-wallet span').text('Aguardando...')
    $('#pld-bank span').text('Aguardando...')
    $('#pld-total span').text('Aguardando...')
  }
  $(document).ready(function () {
    $('#moneylist-search').on('keyup', function () {
      var a8 = $(this).val().toLowerCase()
      $('.moneylist-model').filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(a8) > -1)
      })
    })
  })
  $(document).ready(function () {
    $('#playerlist-search').on('keyup', function () {
      var a9 = $(this).val().toLowerCase()
      $('.playerlist-model').filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(a9) > -1)
      })
    })
  })
  let M = '',
    N = false
  $('.pl-input-sort').click(function () {
    !N
      ? ($('.pl-sort-options').slideDown(), (N = true))
      : ($('.pl-sort-options').slideUp(), (N = false))
  })
  $('#pl-az-name').click(function () {
    M = 'az-by-name'
    $('.pl-sort-options').hide()
    N = false
    $('.pl-input-sort p').text('A-Z Nome')
    F()
  })
  $('#pl-az-id').click(function () {
    M = 'az-by-id'
    $('.pl-sort-options').hide()
    N = false
    $('.pl-input-sort p').text('A-Z Identif.')
    F()
  })
  function O() {
    $('#online-players').hide(), $('.player-details').fadeIn()
  }
  var P = 'all'
  let Q = false,
    R = false
  $(document).on('click', '.playerlist-model', function () {
    $('.det-button').off()
    $('.wpl-confirm-button').off()
    let a8 = $(this).attr('data-id'),
      a9 = $(this).attr('data-name'),
      aa = $(this).attr('data-last-name')
    O()
    $('.detail-name').text(a9 + ' ' + aa)
    $('.detail-id').text(a8)
    $('.players-place-title').text('Detalhes de Usuário')
    $('.playerlist-bottom-content').fadeOut(150)
    $('#det-kick').click(function () {
      action = 'kick_id'
      const ad = { action: action }
      $.post('http://skips_admin/checkPermission', JSON.stringify(ad), (ae) => {
        let af = ae.isAllowed
        af
          ? a8 != undefined &&
            ($.post('http://skips_admin/kickid', JSON.stringify({ id: a8 })),
            (B = 'sucesso'),
            (C = 'SUCESSO!'),
            (D =
              'Você expulsou ' +
              a9.toString() +
              ' ' +
              aa.toString() +
              ' - ID: ' +
              a8.toString()),
            E())
          : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
      })
    })
    $('#det-ban').click(function () {
      action = 'ban_manage'
      const ad = { action: action }
      $.post('http://skips_admin/checkPermission', JSON.stringify(ad), (ae) => {
        let ah = ae.isAllowed
        ah
          ? a8 != undefined &&
            ($.post('http://skips_admin/banid', JSON.stringify({ id: a8 })),
            $.post('http://skips_admin/kickid', JSON.stringify({ id: a8 })),
            (B = 'sucesso'),
            (C = 'SUCESSO!'),
            (D =
              'Você baniu ' +
              a9.toString() +
              ' ' +
              aa.toString() +
              ' - ID: ' +
              a8.toString()),
            E())
          : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
      })
    })
    $('#det-revive').click(function () {
      action = 'revive'
      const ab = { action: action }
      $.post('http://skips_admin/checkPermission', JSON.stringify(ab), (ac) => {
        let ae = ac.isAllowed
        ae
          ? a8 != undefined &&
            ($.post('http://skips_admin/reviveid', JSON.stringify({ id: a8 })),
            (B = 'sucesso'),
            (C = 'SUCESSO!'),
            (D =
              'Você reviveu ' +
              a9.toString() +
              ' ' +
              aa.toString() +
              ' - ID: ' +
              a8.toString()),
            E())
          : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
      })
    })
    $('#det-kill').click(function () {
      action = 'kill'
      const ac = { action: action }
      $.post('http://skips_admin/checkPermission', JSON.stringify(ac), (ad) => {
        let ae = ad.isAllowed
        ae
          ? a8 != undefined &&
            ($.post('http://skips_admin/killid', JSON.stringify({ id: a8 })),
            (B = 'sucesso'),
            (C = 'SUCESSO!'),
            (D =
              'Você matou ' +
              a9.toString() +
              ' ' +
              aa.toString() +
              ' - ID: ' +
              a8.toString()),
            E())
          : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
      })
    })
    $('#det-removewl').click(function () {
      action = 'wl_manage'
      const ad = { action: action }
      $.post('http://skips_admin/checkPermission', JSON.stringify(ad), (ae) => {
        let af = ae.isAllowed
        af
          ? a8 != undefined &&
            ($.post('http://skips_admin/removewl', JSON.stringify({ id: a8 })),
            $.post('http://skips_admin/kickid', JSON.stringify({ id: a8 })),
            (B = 'sucesso'),
            (C = 'SUCESSO!'),
            (D =
              'Você retirou ' +
              a9.toString() +
              ' ' +
              aa.toString() +
              ' - ID: ' +
              a8.toString() +
              ' da whitelist'),
            E(),
            U())
          : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
      })
    })
    $('#det-tptome').click(function () {
      action = 'teleport'
      const ad = { action: action }
      $.post(
        'http://skips_admin/checkManagementPerm',
        JSON.stringify(ad),
        (ae) => {
          let ag = ae.isAllowed
          ag
            ? a8 != undefined &&
              ($.post(
                'http://skips_admin/TeleportToMe',
                JSON.stringify({ id: a8 })
              ),
              (B = 'sucesso'),
              (C = 'SUCESSO!'),
              (D =
                'Você teleportou ' +
                a9.toString() +
                ' ' +
                aa.toString() +
                ' - ID: ' +
                a8.toString() +
                ' para você'),
              E())
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
        }
      )
    })
    $('#det-clearinv').click(function () {
      action = 'items'
      const ad = { action: action }
      $.post(
        'http://skips_admin/checkManagementPerm',
        JSON.stringify(ad),
        (ae) => {
          let ag = ae.isAllowed
          ag
            ? a8 != undefined &&
              ($.post('http://skips_admin/clearInv', JSON.stringify({ id: a8 })),
              (B = 'sucesso'),
              (C = 'SUCESSO!'),
              (D =
                'Você limpou o inventário de ' +
                a9.toString() +
                ' ' +
                aa.toString() +
                ' - ID: ' +
                a8.toString()),
              E())
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
        }
      )
    })
    $('#det-notify').click(function () {
      action = 'notify'
      const ac = { action: action }
      $.post(
        'http://skips_admin/checkManagementPerm',
        JSON.stringify(ac),
        (ad) => {
          let af = ad.isAllowed
          af
            ? a8 != undefined &&
              (z(),
              $('.input-box-title p').text('Digite abaixo a mensagem:'),
              $('#text-input-confirm').click(function () {
                let ah = $('#input-value').val()
                $.post(
                  'http://skips_admin/AdminNotify',
                  JSON.stringify({
                    specified: true,
                    id: a8,
                    message: ah,
                    signature: 'Administração',
                  })
                )
                B = 'sucesso'
                C = 'SUCESSO!'
                D =
                  'Você notificou ' +
                  a9.toString() +
                  ' ' +
                  aa.toString() +
                  ' - ID: ' +
                  a8.toString()
                E()
                A()
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
        }
      )
    })
    $('#det-addbank').click(function () {
      action = 'money'
      const ac = { action: action }
      $.post(
        'http://skips_admin/checkManagementPerm',
        JSON.stringify(ac),
        (ad) => {
          let ag = ad.isAllowed
          ag
            ? a8 != undefined &&
              (z(),
              $('.input-box-title p').text('Digite abaixo a quantidade:'),
              $('#text-input-confirm').click(function () {
                let ai = $('#input-value').val()
                $.post(
                  'http://skips_admin/GiveMoney',
                  JSON.stringify({
                    place: 'bank',
                    id: a8,
                    amount: ai,
                  })
                )
                B = 'sucesso'
                C = 'SUCESSO!'
                D =
                  'Você deu $' +
                  ai.toString() +
                  ' para ' +
                  a9.toString() +
                  ' ' +
                  aa.toString() +
                  ' - ID: ' +
                  a8.toString()
                E()
                A()
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
        }
      )
    })
    $('#det-setbank').click(function () {
      action = 'money'
      const ad = { action: action }
      $.post(
        'http://skips_admin/checkManagementPerm',
        JSON.stringify(ad),
        (ae) => {
          let ah = ae.isAllowed
          ah
            ? a8 != undefined &&
              (z(),
              $('.input-box-title p').text('Digite abaixo a quantidade:'),
              $('#text-input-confirm').click(function () {
                let ai = $('#input-value').val()
                $.post(
                  'http://skips_admin/SetMoney',
                  JSON.stringify({
                    place: 'bank',
                    id: a8,
                    amount: ai,
                  })
                )
                B = 'sucesso'
                C = 'SUCESSO!'
                D =
                  'Você definiu $' +
                  ai.toString() +
                  ' de dinheiro para ' +
                  a9.toString() +
                  ' ' +
                  aa.toString() +
                  ' - ID: ' +
                  a8.toString()
                E()
                A()
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
        }
      )
    })
    $('#det-addwallet').click(function () {
      action = 'money'
      const ad = { action: action }
      $.post(
        'http://skips_admin/checkManagementPerm',
        JSON.stringify(ad),
        (ae) => {
          let ah = ae.isAllowed
          ah
            ? a8 != undefined &&
              (z(),
              $('.input-box-title p').text('Digite abaixo a quantidade:'),
              $('#text-input-confirm').click(function () {
                let ak = $('#input-value').val()
                $.post(
                  'http://skips_admin/GiveMoney',
                  JSON.stringify({
                    place: 'wallet',
                    id: a8,
                    amount: ak,
                  })
                )
                B = 'sucesso'
                C = 'SUCESSO!'
                D =
                  'Você deu $' +
                  ak.toString() +
                  ' para ' +
                  a9.toString() +
                  ' ' +
                  aa.toString() +
                  ' - ID: ' +
                  a8.toString()
                E()
                A()
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
        }
      )
    })
    $('#det-setwallet').click(function () {
      action = 'money'
      const ad = { action: action }
      $.post(
        'http://skips_admin/checkManagementPerm',
        JSON.stringify(ad),
        (ae) => {
          let ah = ae.isAllowed
          ah
            ? a8 != undefined &&
              (z(),
              $('.input-box-title p').text('Digite abaixo a quantidade:'),
              $('#text-input-confirm').click(function () {
                let ai = $('#input-value').val()
                $.post(
                  'http://skips_admin/SetMoney',
                  JSON.stringify({
                    place: 'wallet',
                    id: a8,
                    amount: ai,
                  })
                )
                B = 'sucesso'
                C = 'SUCESSO!'
                D =
                  'Você definiu $' +
                  ai.toString() +
                  ' de dinheiro para ' +
                  a9.toString() +
                  ' ' +
                  aa.toString() +
                  ' - ID: ' +
                  a8.toString()
                E()
                A()
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
        }
      )
    })
    $('#det-giveweapon').click(function () {
      action = 'weapons'
      const ad = { action: action }
      $.post(
        'http://skips_admin/checkManagementPerm',
        JSON.stringify(ad),
        (ae) => {
          let ag = ae.isAllowed
          ag
            ? ((Q = true),
              $('.weapon-list-bg').fadeIn(),
              S(),
              $('#wp-melee').click(function () {
                var ah = $(this)
                P = 'melee'
                S()
                $('.wpl-category').css('color', '#aaa9a9')
                ah.css('color', '#272626')
              }),
              $('#wp-handgun').click(function () {
                var ai = $(this)
                P = 'handgun'
                S()
                $('.wpl-category').css('color', '#aaa9a9')
                ai.css('color', '#272626')
              }),
              $('#wp-submachine').click(function () {
                var ai = $(this)
                P = 'submachine'
                S()
                $('.wpl-category').css('color', '#aaa9a9')
                ai.css('color', '#272626')
              }),
              $('#wp-assault').click(function () {
                var ah = $(this)
                P = 'assault'
                S()
                $('.wpl-category').css('color', '#aaa9a9')
                ah.css('color', '#272626')
              }),
              $('#wp-shotgun').click(function () {
                var ai = $(this)
                P = 'shotgun'
                S()
                $('.wpl-category').css('color', '#aaa9a9')
                ai.css('color', '#272626')
              }),
              $('#wp-throwable').click(function () {
                var ah = $(this)
                P = 'throwable'
                S()
                $('.wpl-category').css('color', '#aaa9a9')
                ah.css('color', '#272626')
              }),
              $('#wp-rifle').click(function () {
                var ah = $(this)
                P = 'rifle'
                S()
                $('.wpl-category').css('color', '#aaa9a9')
                ah.css('color', '#272626')
              }),
              $('#wp-special').click(function () {
                var ai = $(this)
                P = 'special'
                S()
                $('.wpl-category').css('color', '#aaa9a9')
                ai.css('color', '#272626')
              }),
              $('#wp-all').click(function () {
                var ai = $(this)
                P = 'all'
                S()
                $('.wpl-category').css('color', '#aaa9a9')
                ai.css('color', '#272626')
              }))
            : ((B = 'negado'), (C = 'ERRO!'), (D = 'Sem permissão'), E())
        }
      )
    })
    $('#det-remweapon').click(function () {
      const af = {}
      af.id = a8
      $.post('http://skips_admin/clearPlayerWeapons', JSON.stringify(af))
      B = 'sucesso'
      C = 'SUCESSO!'
      D =
        'Você limpou a roda de armas de ' +
        a9.toString() +
        ' ' +
        aa.toString() +
        ' - ID: ' +
        a8.toString()
      E()
    })
    $('.wpl-confirm-button').click(function () {
      $('#ammo-confirm').off()
      let ad = $('.weaponlist-model.active'),
        ae = ad.attr('data-name-key'),
        af = ad.attr('data-name-name'),
        ag = ad.attr('data-name-type')
      document.getElementById('ammo-amount').focus()
      ad &&
        (ae != undefined
          ? ag != 'melee'
            ? ($('.ammo-amount-bg').fadeIn(),
              (R = true),
              $('#ammo-confirm').click(function () {
                let ai = $('#ammo-amount').val()
                !isNaN(ai)
                  ? ai <= 250
                    ? (ai == 0 && (ai = 250),
                      $.post(
                        'http://skips_admin/giveWeaponToPlayer',
                        JSON.stringify({
                          weapon: ae,
                          id: a8,
                          ammo: ai,
                        })
                      ),
                      (B = 'sucesso'),
                      (C = 'SUCESSO!'),
                      (D =
                        'Você adicionou ' +
                        af.toString() +
                        ' na roda de armas do ID ' +
                        a8.toString()),
                      E(),
                      $('.ammo-amount-bg').fadeOut(),
                      $('#ammo-amount').val(''),
                      (R = false),
                      $('.weaponlist-model').removeClass('active'))
                    : ((B = 'negado'),
                      (C = 'ERRO!'),
                      (D = 'O limite máximo de munição é de 250x.'),
                      E(),
                      $('.ammo-amount-bg').fadeOut(),
                      $('#ammo-amount').val(''),
                      (R = false))
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D =
                      'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                    E(),
                    $('.ammo-amount-bg').fadeOut(),
                    $('#ammo-amount').val(''),
                    (R = false))
              }),
              $('#ammo-cancel').click(function () {
                $('.ammo-amount-bg').fadeOut(),
                  $('#ammo-amount').val(''),
                  (R = false)
              }))
            : ($.post(
                'http://skips_admin/giveWeaponToPlayer',
                JSON.stringify({
                  weapon: ae,
                  id: a8,
                  ammo: 1,
                })
              ),
              (B = 'sucesso'),
              (C = 'SUCESSO!'),
              (D =
                'Você adicionou ' +
                af.toString() +
                ' na roda de armas do ID ' +
                a8.toString()),
              E(),
              $('.weaponlist-model').removeClass('active'))
          : ((B = 'negado'),
            (C = 'ERRO!'),
            (D = 'Selecione uma arma para adicionar'),
            E()))
    })
  })
  $('.pl-button-search-id').click(function () {
    z()
    $('.input-box-title p').text('Digite abaixo o ID:')
    $('.wpl-confirm-button').off()
    $('#text-input-confirm').click(function () {
      let aa = $('#input-value').val()
      const ab = { id: aa }
      $.post('http://skips_admin/getSpecifiedPlayer', JSON.stringify(ab), (ac) => {
        let ae = ac.name,
          af = ac.lastname,
          ag = ac.state
        ag
          ? ($('.det-button').off(),
            $('#online-players').hide(),
            $('.player-details').fadeIn(),
            $('.detail-name').text(ae + ' ' + af),
            $('.detail-id').text(aa),
            $('.players-place-title').text('Detalhes de Usuário'),
            $('.playerlist-bottom-content').fadeOut(150),
            A(),
            $('.wpl-category').off(),
            $('#det-kick').click(function () {
              aa != undefined &&
                ($.post('http://skips_admin/kickid', JSON.stringify({ id: aa })),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D =
                  'Você expulsou ' +
                  ae.toString() +
                  ' ' +
                  af.toString() +
                  ' - ID: ' +
                  aa.toString()),
                E())
            }),
            $('#det-ban').click(function () {
              aa != undefined &&
                ($.post('http://skips_admin/banid', JSON.stringify({ id: aa })),
                $.post('http://skips_admin/kickid', JSON.stringify({ id: aa })),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D =
                  'Você baniu ' +
                  ae.toString() +
                  ' ' +
                  af.toString() +
                  ' - ID: ' +
                  aa.toString()),
                E())
            }),
            $('#det-revive').click(function () {
              aa != undefined &&
                ($.post('http://skips_admin/reviveid', JSON.stringify({ id: aa })),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D =
                  'Você reviveu ' +
                  ae.toString() +
                  ' ' +
                  af.toString() +
                  ' - ID: ' +
                  aa.toString()),
                E())
            }),
            $('#det-kill').click(function () {
              aa != undefined &&
                ($.post('http://skips_admin/killid', JSON.stringify({ id: aa })),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D =
                  'Você matou ' +
                  ae.toString() +
                  ' ' +
                  af.toString() +
                  ' - ID: ' +
                  aa.toString()),
                E())
            }),
            $('#det-removewl').click(function () {
              aa != undefined &&
                ($.post('http://skips_admin/removewl', JSON.stringify({ id: aa })),
                $.post('http://skips_admin/kickid', JSON.stringify({ id: aa })),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D =
                  'Você retirou ' +
                  ae.toString() +
                  ' ' +
                  af.toString() +
                  ' - ID: ' +
                  aa.toString() +
                  ' da whitelist'),
                E(),
                U())
            }),
            $('#det-tptome').click(function () {
              aa != undefined &&
                ($.post(
                  'http://skips_admin/TeleportToMe',
                  JSON.stringify({ id: aa })
                ),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D =
                  'Você teleportou ' +
                  ae.toString() +
                  ' ' +
                  af.toString() +
                  ' - ID: ' +
                  aa.toString() +
                  ' para você'),
                E())
            }),
            $('#det-clearinv').click(function () {
              aa != undefined &&
                ($.post('http://skips_admin/clearInv', JSON.stringify({ id: aa })),
                (B = 'sucesso'),
                (C = 'SUCESSO!'),
                (D =
                  'Você limpou o inventário de ' +
                  ae.toString() +
                  ' ' +
                  af.toString() +
                  ' - ID: ' +
                  aa.toString()),
                E())
            }),
            $('#det-notify').click(function () {
              aa != undefined &&
                (z(),
                $('.input-box-title p').text('Digite abaixo a mensagem:'),
                $('#text-input-confirm').click(function () {
                  let ak = $('#input-value').val()
                  $.post(
                    'http://skips_admin/AdminNotify',
                    JSON.stringify({
                      specified: true,
                      id: aa,
                      message: ak,
                      signature: 'Administração',
                    })
                  )
                  B = 'sucesso'
                  C = 'SUCESSO!'
                  D =
                    'Você notificou ' +
                    ae.toString() +
                    ' ' +
                    af.toString() +
                    ' - ID: ' +
                    aa.toString()
                  E()
                  A()
                }))
            }),
            $('#det-giveweapon').click(function () {
              ;(Q = true),
                $('.weapon-list-bg').fadeIn(),
                S(),
                $('#wp-melee').click(function () {
                  var ak = $(this)
                  P = 'melee'
                  S()
                  $('.wpl-category').css('color', '#aaa9a9')
                  ak.css('color', '#272626')
                }),
                $('#wp-handgun').click(function () {
                  var aj = $(this)
                  P = 'handgun'
                  S()
                  $('.wpl-category').css('color', '#aaa9a9')
                  aj.css('color', '#272626')
                }),
                $('#wp-submachine').click(function () {
                  var aj = $(this)
                  P = 'submachine'
                  S()
                  $('.wpl-category').css('color', '#aaa9a9')
                  aj.css('color', '#272626')
                }),
                $('#wp-assault').click(function () {
                  var ak = $(this)
                  P = 'assault'
                  S()
                  $('.wpl-category').css('color', '#aaa9a9')
                  ak.css('color', '#272626')
                }),
                $('#wp-shotgun').click(function () {
                  var ak = $(this)
                  P = 'shotgun'
                  S()
                  $('.wpl-category').css('color', '#aaa9a9')
                  ak.css('color', '#272626')
                }),
                $('#wp-throwable').click(function () {
                  var aj = $(this)
                  P = 'throwable'
                  S()
                  $('.wpl-category').css('color', '#aaa9a9')
                  aj.css('color', '#272626')
                }),
                $('#wp-rifle').click(function () {
                  var aj = $(this)
                  P = 'rifle'
                  S()
                  $('.wpl-category').css('color', '#aaa9a9')
                  aj.css('color', '#272626')
                }),
                $('#wp-special').click(function () {
                  var aj = $(this)
                  P = 'special'
                  S()
                  $('.wpl-category').css('color', '#aaa9a9')
                  aj.css('color', '#272626')
                }),
                $('#wp-all').click(function () {
                  var aj = $(this)
                  P = 'all'
                  S()
                  $('.wpl-category').css('color', '#aaa9a9')
                  aj.css('color', '#272626')
                })
            }),
            $('#det-remweapon').click(function () {
              const al = {}
              al.id = aa
              $.post('http://skips_admin/clearPlayerWeapons', JSON.stringify(al))
              B = 'sucesso'
              C = 'SUCESSO!'
              D =
                'Você limpou a roda de armas de ' +
                ae.toString() +
                ' ' +
                af.toString() +
                ' - ID: ' +
                aa.toString()
              E()
            }),
            $('.wpl-confirm-button').click(function () {
              $('#ammo-confirm').off()
              let ai = $('.weaponlist-model.active'),
                aj = ai.attr('data-name-key'),
                ak = ai.attr('data-name-name'),
                al = ai.attr('data-name-type')
              document.getElementById('ammo-amount').focus()
              ai &&
                (aj != undefined
                  ? al != 'melee'
                    ? ($('.ammo-amount-bg').fadeIn(),
                      (R = true),
                      $('#ammo-confirm').click(function () {
                        let am = $('#ammo-amount').val()
                        !isNaN(am)
                          ? am <= 250
                            ? (am == 0 && (am = 250),
                              $.post(
                                'http://skips_admin/giveWeaponToPlayer',
                                JSON.stringify({
                                  weapon: aj,
                                  id: aa,
                                  ammo: am,
                                })
                              ),
                              (B = 'sucesso'),
                              (C = 'SUCESSO!'),
                              (D =
                                'Você adicionou ' +
                                ak.toString() +
                                ' na roda de armas do ID ' +
                                aa.toString()),
                              E(),
                              $('.ammo-amount-bg').fadeOut(),
                              $('#ammo-amount').val(''),
                              (R = false),
                              $('.weaponlist-model').removeClass('active'))
                            : ((B = 'negado'),
                              (C = 'ERRO!'),
                              (D = 'O limite máximo de munição é de 250x.'),
                              E(),
                              $('.ammo-amount-bg').fadeOut(),
                              $('#ammo-amount').val(''),
                              (R = false))
                          : ((B = 'negado'),
                            (C = 'ERRO!'),
                            (D =
                              'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                            E(),
                            $('.ammo-amount-bg').fadeOut(),
                            $('#ammo-amount').val(''),
                            (R = false))
                      }),
                      $('#ammo-cancel').click(function () {
                        $('.ammo-amount-bg').fadeOut()
                        $('#ammo-amount').val('')
                        R = false
                      }))
                    : ($.post(
                        'http://skips_admin/giveWeaponToPlayer',
                        JSON.stringify({
                          weapon: aj,
                          id: aa,
                          ammo: 1,
                        })
                      ),
                      (B = 'sucesso'),
                      (C = 'SUCESSO!'),
                      (D =
                        'Você adicionou ' +
                        ak.toString() +
                        ' na roda de armas do ID ' +
                        aa.toString()),
                      E(),
                      $('.weaponlist-model').removeClass('active'))
                  : ((B = 'negado'),
                    (C = 'ERRO!'),
                    (D = 'Selecione uma arma para adicionar'),
                    E()))
            }))
          : ((B = 'negado'),
            (C = 'ERRO!'),
            (D = 'O ID é inexistente ou está indisponível.'),
            E(),
            A())
      })
    })
  })
  const S = () => {
    const a8 = { type: P }
    $.post('http://skips_admin/requestWeapons', JSON.stringify(a8), (a9) => {
      var ab = a9.weapons.sort()
      $('#weapon-list').html(
        '\n                ' +
          ab
            .map(
              (ad) =>
                '\n                    <div class="weaponlist-model" data-name-key="' +
                ad.weapon_id +
                '" data-name-name="' +
                ad.weapon_name +
                '" data-name-type="' +
                ad.weapon_type +
                '">\n                        <div class="weaponlist-name"> ' +
                ad.weapon_name +
                ' </div>\n                        <div class="weaponlist-image"><img src="' +
                ad.weapon_directory +
                '/' +
                ad.weapon_name +
                '.png"></div>\n                    \n                    </div>\n                '
            )
            .join('') +
          '\n            '
      )
    })
  }
  $(document).on('click', '.weaponlist-model', function () {
    let a8 = $(this),
      a9 = a8.hasClass('active')
    $('.weaponlist-model').removeClass('active')
    !a9 && a8.addClass('active')
  })
  $('.wpl-close-button').click(function () {
    $('.weapon-list-bg').fadeOut()
    $('#wpl-search').val('')
    Q = false
  })
  $(document).ready(function () {
    $('#wpl-search').on('keyup', function () {
      var a9 = $(this).val().toLowerCase()
      $('.weaponlist-model').filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(a9) > -1)
      })
    })
  })
  let T = false
  $('.category-filter-icon').click(function () {
    !T
      ? ($('.category-filter-icon i > i').removeClass('fas fa-arrow-right'),
        $('.category-filter-icon i > i').addClass('fas fa-times-circle'),
        $('.category-filter-icon').css('color', '#272626'),
        (T = true),
        $('.weapon-category-options').fadeIn(150))
      : ($('.category-filter-icon i > i').removeClass('fas fa-times-circle'),
        $('.category-filter-icon i > i').addClass('fas fa-arrow-right'),
        $('.category-filter-icon').css('color', '#d1d1d1'),
        (T = false),
        $('.weapon-category-options').fadeOut(150))
  })
  function U() {
    $('.player-details').hide()
    $('#online-players').fadeIn()
    $('.playerlist-bottom-content').fadeIn()
    $('.players-place-title').text('Jogadores Online')
    F()
  }
  $('.det-back-button').click(function () {
    U()
  })
  $('.playerlist-refresh').click(function () {
    $('#online-players').fadeOut(20).delay(20).fadeIn(20)
    F()
  })
  const V = () => {
    $.post('http://skips_admin/requestVehicles', JSON.stringify({}), (a7) => {
      if (W == 'az-by-name') {
        var a9 = a7.vehicle.sort((ab, ac) => (ab.name > ac.name ? 1 : -1))
      } else {
        if (W == 'az-by-id') {
          var a9 = a7.vehicle.sort((ac, ad) => (ac.k > ad.k ? 1 : -1))
        } else {
          var a9 = a7.vehicle.sort((ad, ae) => (ad.name > ae.name ? 1 : -1))
        }
      }
      $('#base-vehicles').html(
        '\n                ' +
          a9
            .map(
              (ae) =>
                '\n                    <div class="vehicles-model" data-name-key="' +
                ae.k +
                '">\n                        <div class="vehicles-image"><img src="' +
                ae.vehicle_directory +
                '/' +
                ae.k +
                '.png"></div>\n                        \n                        <div class="vehicles-name"> <b>Nome: </b>' +
                ae.name +
                ' - ' +
                ae.k +
                ' </div>\n                        <div class="vehicles-take-btn spawn-it" data-name-key="' +
                ae.k +
                '" data-name-veh="' +
                ae.name +
                '"><p><i class="fas fa-exclamation-circle"></i> Spawnar Veículo </p></div>\n                        <div class="vehicles-take-btn add-to-garage" data-name-key="' +
                ae.k +
                '" data-name-veh="' +
                ae.name +
                '"><p> <i class="fas fa-plus"></i> Adicionar à </p></div>\n                        <div class="vehicles-take-btn rem-from-garage" data-name-key="' +
                ae.k +
                '" data-name-veh="' +
                ae.name +
                '"><p> <i class="fas fa-times"></i> Remover de </p></div>\n                    </div>\n                '
            )
            .join('') +
          '\n            '
      )
    })
  }
  $(document).on('click', '.spawn-it', function () {
    let a7 = $(this),
      a8 = a7.attr('data-name-key')
    a8 != undefined &&
      ($.post('http://skips_admin/spawnVehicle', JSON.stringify({ vehicle: a8 })),
      $.post('http://skips_admin/TriggerUI'))
  })
  $(document).on('click', '.add-to-garage', function () {
    let a8 = $(this),
      a9 = a8.attr('data-name-key'),
      aa = a8.attr('data-name-veh')
    z()
    $('.input-box-title p').text('Digite abaixo o ID:')
    $('#text-input-confirm').click(function () {
      if (a9 != undefined) {
        let ad = $('#input-value').val()
        !isNaN(ad)
          ? ad != 0
            ? ($.post(
                'http://skips_admin/addToGarage',
                JSON.stringify({
                  id: ad,
                  veh: a9,
                })
              ),
              (B = 'sucesso'),
              (C = 'SUCESSO!'),
              (D =
                'Você adicionou o veículo ' +
                aa.toString() +
                ' para o ID ' +
                document.getElementsByName('input-text')[0].value),
              E(),
              A())
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
              E(),
              A())
          : ((B = 'negado'),
            (C = 'ERRO!'),
            (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
            E(),
            A())
      }
    })
  })
  $(document).on('click', '.rem-from-garage', function () {
    let a7 = $(this),
      a8 = a7.attr('data-name-key'),
      a9 = a7.attr('data-name-veh')
    z()
    $('.input-box-title p').text('Digite abaixo o ID:')
    $('#text-input-confirm').click(function () {
      if (a8 != undefined) {
        let ac = $('#input-value').val()
        !isNaN(ac)
          ? ac != 0
            ? ($.post(
                'http://skips_admin/remFromGarage',
                JSON.stringify({
                  id: ac,
                  veh: a8,
                })
              ),
              A(),
              (B = 'sucesso'),
              (C = 'SUCESSO!'),
              (D =
                'Você removeu o veículo ' +
                a9.toString() +
                ' do ID ' +
                document.getElementsByName('input-text')[0].value),
              E())
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
              E(),
              A())
          : ((B = 'negado'),
            (C = 'ERRO!'),
            (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
            E(),
            A())
      }
    })
  })
  $(document).ready(function () {
    $('#vehs-search').on('keyup', function () {
      var a9 = $(this).val().toLowerCase()
      $('.vehicles-model').filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(a9) > -1)
      })
    })
  })
  let W = '',
    X = false
  $('.veh-input-sort').click(function () {
    !X
      ? ($('.veh-sort-options').slideDown(), (X = true))
      : ($('.veh-sort-options').slideUp(), (X = false))
  })
  $('#veh-az-name').click(function () {
    W = 'az-by-name'
    $('.veh-sort-options').hide()
    X = false
    $('.veh-input-sort p').text('A-Z Nome')
    V()
  })
  $('#veh-az-id').click(function () {
    W = 'az-by-id'
    $('.veh-sort-options').hide()
    X = false
    $('.veh-input-sort p').text('A-Z Identif.')
    V()
  })
  const Y = () => {
      $.post('http://skips_admin/requestItemList', JSON.stringify({}), (a8) => {
        var a9 = a8.item.sort((ac, ad) => (ac.k > ad.k ? 1 : -1))
        let ab = 0
        $('#base-items').html(
          '\n                ' +
            a9
              .map(
                (ac) =>
                  '\n                    <div class="item-model" data-name-key="' +
                  ac.k +
                  '">\n                        <div class="item-name"> ' +
                  ac.name +
                  ' </div>\n                        <!--<div class="item-name"> ' +
                  (ab = ab + 1) +
                  ' </div>-->\n                        <div class="item-image"><img src="' +
                  ac.item_directory +
                  '/' +
                  ac.k +
                  '.png"></div>\n                        \n                        <div class="item-take-btn" data-name-key="' +
                  ac.k +
                  '" data-name-item="' +
                  ac.name +
                  '"> Pegar </div>\n                    </div>\n                '
              )
              .join('') +
            '\n            '
        )
      })
    },
    Z = () => {
      $.post('http://skips_admin/requestItemList', JSON.stringify({}), (a7) => {
        var a9 = a7.item.sort((aa, ab) => (aa.k > ab.k ? 1 : -1))
        $('#item-list').html(
          '\n            ' +
            a9
              .map(
                (aa) =>
                  '\n                    <div class="item-list-model" data-name-key="' +
                  aa.k +
                  '">\n                        <div class="item-list-name"> ' +
                  aa.name +
                  ' </div>\n                            \n                        <div class="item-list-image"><img src="' +
                  aa.item_directory +
                  '/' +
                  aa.k +
                  '.png"></div>\n                    </div>\n                '
              )
              .join('') +
            '\n            '
        )
      })
    }
  $('.clear-id-inv').click(function () {
    z(),
      $('.input-box-title p').text('Digite abaixo o ID:'),
      $('#text-input-confirm').click(function () {
        let a8 = $('#input-value').val()
        !isNaN(a8)
          ? a8 != 0
            ? ($.post('http://skips_admin/clearInv', JSON.stringify({ id: a8 })),
              A(),
              (B = 'sucesso'),
              (C = 'SUCESSO!'),
              (D =
                'Você limpou o inventário do ID ' +
                document.getElementsByName('input-text')[0].value),
              E())
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
              E(),
              A())
          : ((B = 'negado'),
            (C = 'ERRO!'),
            (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
            E(),
            A())
      })
  })
  $(document).on('click', '.item-list-model', function () {
    let a7 = $(this),
      a8 = a7.hasClass('active')
    $('.item-list-model').removeClass('active')
    !a8 && a7.addClass('active')
  })
  let a0 = false
  $('#give-to-id').click(function () {
    $('.add-button-il').off(),
      $('.item-list-bg').fadeIn(),
      Z(),
      (a0 = true),
      $('.item-list-close').click(function () {
        $('.item-list-bg').fadeOut()
        a0 = false
        $('#item-to-id').val('')
        $('#item-list-amount').val('')
        $('#item-list-search').val('')
      }),
      $('.add-button-il').click(function () {
        let a8 = $('#item-to-id').val(),
          a9 = $('#item-list-amount').val(),
          aa = $('.item-list-model.active'),
          ab = aa.attr('data-name-key')
        aa &&
          (!isNaN(a8)
            ? !isNaN(a9)
              ? ab != undefined
                ? ($.post(
                    'http://skips_admin/giveItemToID',
                    JSON.stringify({
                      user: a8,
                      amount: a9,
                      item: ab,
                    })
                  ),
                  (B = 'sucesso'),
                  (C = 'SUCESSO!'),
                  (D =
                    'Você deu ' +
                    document.getElementsByName('item-list-amount')[0].value +
                    'x ' +
                    ab.toString() +
                    '(s) para o ID ' +
                    document.getElementsByName('item-to-id')[0].value),
                  E(),
                  $('.item-list-bg').fadeOut(),
                  (a0 = false),
                  $('#item-to-id').val(''),
                  $('#item-list-amount').val(''),
                  $('#item-list-search').val(''))
                : ((B = 'negado'),
                  (C = 'ERRO!'),
                  (D = 'Selecione um item.'),
                  E(),
                  $('#item-to-id').val(''),
                  $('#item-list-amount').val(''),
                  $('#item-list-search').val(''))
              : ((B = 'negado'),
                (C = 'ERRO!'),
                (D =
                  'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
                E(),
                $('#item-to-id').val(''),
                $('#item-list-amount').val(''),
                $('#item-list-search').val(''),
                (a0 = false))
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
              E(),
              $('#item-to-id').val(''),
              $('#item-list-amount').val(''),
              $('#item-list-search').val(''),
              (a0 = false)))
      })
  })
  $(document).on('click', '.item-take-btn', function () {
    let a7 = $(this),
      a8 = a7.attr('data-name-key'),
      a9 = $(this).attr('data-name-item')
    z()
    $('.input-box-title p').text('Digite abaixo a quantidade:')
    $('#text-input-confirm').click(function () {
      let ac = $('#input-value').val()
      !isNaN(ac)
        ? ac != 0
          ? ($.post(
              'http://skips_admin/takeItem',
              JSON.stringify({
                item: a8,
                amount: ac,
              })
            ),
            (B = 'sucesso'),
            (C = 'SUCESSO!'),
            (D =
              'Você pegou ' +
              document.getElementsByName('input-text')[0].value +
              'x ' +
              a9.toString() +
              '(s)'),
            E(),
            A())
          : ((B = 'negado'),
            (C = 'ERRO!'),
            (D = 'Digite um QTD. válida, utilize apenas caracteres numéricos.'),
            E(),
            A())
        : ((B = 'negado'),
          (C = 'ERRO!'),
          (D = 'Digite uma QTD. válida, utilize apenas caracteres numéricos.'),
          E(),
          A())
    })
  })
  $(document).ready(function () {
    $('#item-list-search').on('keyup', function () {
      var a9 = $(this).val().toLowerCase()
      $('.item-list-model').filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(a9) > -1)
      })
    })
  })
  $(document).ready(function () {
    $('#items-search').on('keyup', function () {
      var a7 = $(this).val().toLowerCase()
      $('.item-model').filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(a7) > -1)
      })
    })
  })
  const a1 = () => {
    $.post('http://skips_admin/requestGroups', JSON.stringify({}), (a7) => {
      if (a2 == 'az-by-id') {
        var a8 = a7.groups.sort((aa, ab) => (aa.k > ab.k ? 1 : -1))
      } else {
        if (a2 == 'az-by-name') {
          var a8 = a7.groups.sort((aa, ab) => (aa.name > ab.name ? 1 : -1))
        } else {
          var a8 = a7.groups.sort((aa, ab) => (aa.k > ab.k ? 1 : -1))
        }
      }
      let a9 = 0
      $('#base-groups').html(
        '\n                <div class="groups-infos">\n                    <div class="gp-info gp-number-tit"> <b><p> Nº </p> </div>\n                    <div class="gp-info gp-identifier-tit"> <p> Identificador </p> </div>\n                    <div class="gp-info gp-name-tit"> <p> Nome </p></b> </div>\n                </div>\n                ' +
          a8
            .map(
              (aa) =>
                '\n                    <div class="group-model" data-name-key="' +
                aa.k +
                '">\n                        <div class="gp-number">\n                            <div class="group group-number">  ' +
                (a9 = a9 + 1) +
                ' </div>\n                        </div>\n                        <div class="gp-identifier">\n                            <div class="group group-raw">  ' +
                aa.k +
                ' </div>\n                        </div>\n\n                        <div class="gp-name">\n                            <div class="group group-name"> ' +
                aa.name +
                ' </div>\n                        </div>\n                    </div>  \n                '
            )
            .join('') +
          '\n            '
      )
    })
  }
  $(document).ready(function () {
    $('#group-search').on('keyup', function () {
      var a8 = $(this).val().toLowerCase()
      $('.group-model').filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(a8) > -1)
      })
    })
  })
  $(document).on('click', '.group-model', function () {
    let a6 = $(this),
      a7 = a6.hasClass('active')
    $('.group-model').removeClass('active')
    !a7 && a6.addClass('active')
  })
  $('.add-to-group').click(function () {
    z()
    $('.input-box-title p').text('Digite abaixo o ID:')
    $('#text-input-confirm').click(function () {
      let a7 = $('.group-model.active'),
        a8 = $('#input-value').val(),
        a9 = a7.attr('data-name-key')
      a7 &&
        (!isNaN(a8)
          ? a8 != 0
            ? ($.post(
                'http://skips_admin/setUserGroup',
                JSON.stringify({
                  group: a9,
                  id: a8,
                })
              ),
              a9 != undefined
                ? (A(),
                  (B = 'sucesso'),
                  (C = 'SUCESSO!'),
                  (D =
                    'Você mudou as configurações de grupo do ID ' +
                    document.getElementsByName('input-text')[0].value),
                  E(),
                  a7.removeClass('active'))
                : ((B = 'negado'),
                  (C = 'ERRO!'),
                  (D = 'Selecione um grupo para adicionar.'),
                  E(),
                  A()))
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
              E(),
              A())
          : ((B = 'negado'),
            (C = 'ERRO!'),
            (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
            E(),
            A()))
    })
  })
  $('.rem-from-group').click(function () {
    z()
    $('.input-box-title p').text('Digite abaixo o ID:')
    $('#text-input-confirm').click(function () {
      let a6 = $('.group-model.active'),
        a7 = $('#input-value').val(),
        a8 = a6.attr('data-name-key')
      a6 &&
        (!isNaN(a7)
          ? a7 != 0
            ? ($.post(
                'http://skips_admin/removeUserGroup',
                JSON.stringify({
                  group: a8,
                  id: a7,
                })
              ),
              a8 != undefined
                ? (A(),
                  (B = 'sucesso'),
                  (C = 'SUCESSO!'),
                  (D =
                    'Você mudou as configurações de grupo do ID ' +
                    document.getElementsByName('input-text')[0].value),
                  E(),
                  a6.removeClass('active'))
                : ((B = 'negado'),
                  (C = 'ERRO!'),
                  (D = 'Selecione um grupo para remover.'),
                  E(),
                  A()))
            : ((B = 'negado'),
              (C = 'ERRO!'),
              (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
              E(),
              A())
          : ((B = 'negado'),
            (C = 'ERRO!'),
            (D = 'Digite um ID válido, utilize apenas caracteres numéricos.'),
            E(),
            A()))
    })
  })
  let a2 = '',
    a3 = false
  $('.gp-input-sort').click(function () {
    !a3
      ? ($('.gp-sort-options').slideDown(), (a3 = true))
      : ($('.gp-sort-options').slideUp(), (a3 = false))
  })
  $('#az-name').click(function () {
    a2 = 'az-by-name'
    $('.gp-sort-options').hide()
    a3 = false
    $('.gp-input-sort p').text('A-Z Nome')
    a1()
  })
  $('#az-id').click(function () {
    a2 = 'az-by-id'
    $('.gp-sort-options').hide()
    a3 = false
    $('.gp-input-sort p').text('A-Z Identif.')
    a1()
  })
  var a4 = [
    'Administrador',
    'Moderador',
    'Suporte',
    'Equipe',
    'Staff',
    'Administração',
    'Moderação',
    'Fundador',
    'Gestor',
    'Dono',
    'Proprietário',
  ]
  function a5(a6, a7) {
    var a9
    a6.addEventListener('input', function (ad) {
      var af,
        ag,
        ah,
        ai = this.value
      ac()
      if (!ai) {
        return false
      }
      a9 = -1
      af = document.createElement('DIV')
      af.setAttribute('id', this.id + 'autocomplete-list')
      af.setAttribute('class', 'autocomplete-items')
      this.parentNode.appendChild(af)
      for (ah = 0; ah < a7.length; ah++) {
        a7[ah].substr(0, ai.length).toUpperCase() == ai.toUpperCase() &&
          ((ag = document.createElement('DIV')),
          (ag.innerHTML =
            '<strong>' + a7[ah].substr(0, ai.length) + '</strong>'),
          (ag.innerHTML += a7[ah].substr(ai.length)),
          (ag.innerHTML += "<input type='hidden' value='" + a7[ah] + "'>"),
          ag.addEventListener('click', function (aj) {
            a6.value = this.getElementsByTagName('input')[0].value
            ac()
          }),
          af.appendChild(ag))
      }
    })
    a6.addEventListener('keydown', function (ad) {
      var ae = document.getElementById(this.id + 'autocomplete-list')
      ae && (ae = ae.getElementsByTagName('div'))
      ad.keyCode == 40
        ? (a9++, aa(ae))
        : ad.keyCode == 38
        ? (a9--, aa(ae))
        : ad.keyCode == 13 &&
          (ad.preventDefault(), a9 > -1 && ae && ae[a9].click())
    })
    function aa(ad) {
      if (!ad) {
        return false
      }
      ab(ad)
      a9 >= ad.length && (a9 = 0)
      a9 < 0 && (a9 = ad.length - 1)
      ad[a9].classList.add('autocomplete-active')
    }
    function ab(ad) {
      for (var ae = 0; ae < ad.length; ae++) {
        ad[ae].classList.remove('autocomplete-active')
      }
    }
    function ac(ad) {
      var ae = document.getElementsByClassName('autocomplete-items')
      for (var af = 0; af < ae.length; af++) {
        ad != ae[af] && ad != a6 && ae[af].parentNode.removeChild(ae[af])
      }
    }
    document.addEventListener('click', function (ad) {
      ac(ad.target)
    })
  }
  a5(document.getElementById('signature'), a4)
  $('.close-box').click(function () {
    $.post('http://skips_admin/TriggerUI')
  })
  $('.cfg-close-box').click(function () {
    $('.config-display').fadeOut()
    j = false
  })
  $('#text-input-cancel').click(function () {
    A()
  })
})