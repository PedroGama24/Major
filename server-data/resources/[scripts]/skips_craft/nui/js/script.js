$(document).ready(function () {
    window.addEventListener('message', function (U) {
        let Y = U.data
        if (!Y.show) {
            $('.container').fadeOut()
            $('.containerItems').html('')
            return
        }
        if (Y.show) {
            $('.containerItems').html('')
            $('.container').fadeIn()
            loadCraftTable(Y)
            return
        }
    })
})

function loadCraftTable(m) {
    if (m) {
        let Q = m.items,
            Y = 0
        for (let B in Q) {
            if (B) {
                const W = Q[B].requires
                Y = Y + 1
                $('.containerItems').append(
                    '\n\t\t\t\t\t<div class="item" id="item-' +
                    Y +
                    '">\n\t\t\t\t\t\t<div class="item-imagem" id="item-' +
                    Y +
                    '">\n\t\t\t\t\t\t\t<img src="' +
                    m.imgDir +
                    B +
                    '.png">\n\t\t\t\t\t\t\t<div class="item-name">' +
                    Q[B].nameItem +
                    '</div>\n\t\t\t\t\t\t\t<div class="item-time" data-value = \'' +
                    Q[B].tempo +
                    "'>" +
                    convertSeconds(Q[B].tempo) +
                    '</div>\n\t\t\t\t\t\t\t<div class="item-quantidade" data-maxValue=\'' +
                    Q[B].maxAmount +
                    "' data-minValue='1' data-value = '" +
                    Q[B].customAmount +
                    '\' value = "1">' +
                    Q[B].customAmount +
                    ' x</div>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\n\t\t\t\t\t\t<div class= "item-req" id="item-' +
                    Y +
                    '">\n\t\t\t\t\t\t\t' +
                    W.map(
                        (J) =>
                        '\n\t\t\t\t\t\t\t\t<div class="item-craft">\n\t\t\t\t\t\t\t\t\t<img src = "' +
                        m.imgDir +
                        J.item +
                        '.png">\n\t\t\t\t\t\t\t\t\t<div class="item-craft-quantidade" data-value="' +
                        J.amount +
                        '" id="' +
                        J.item +
                        '">' +
                        J.amount +
                        ' x</div>\n\t\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\t'
                    ).join('') +
                    '\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t\t<div class="item-input">\n\t\t\t\t\t\t\t<div class=\'arrowS arrow arrow-left\'><i class=\'fas fa-chevron-left\'></i></div>\n\t\t\t\t\t\t\t<input value="1" type="range" min="1" max="' +
                    Q[B].maxAmount +
                    "\">\n\t\t\t\t\t\t\t<div class='arrowS arrow arrow-right'><i class='fas fa-chevron-right'></i></div>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\n\t\t\t\t\t\t<button class=\"fabricar\" onclick=\"fabricarItem('item-" +
                    Y +
                    "', '" +
                    B +
                    "', '" +
                    Q[B].spawnID +
                    "', '" +
                    m.orgID +
                    '\')">Fabricar</button>\n\t\t\t\t\t</div>\n\t\t\t\t'
                )
            }
        }
    }
    $('.arrow-right').on('click', function (Z) {
        Z.preventDefault()
        var f = parseFloat($(this).prev().val()),
            n = parseFloat(f + 1),
            C = $(this)
            .parent()
            .parent()
            .find('.item-quantidade')
            .attr('data-maxValue'),
            e = $(this)
            .parent()
            .parent()
            .find('.item-imagem .item-quantidade')
            .attr('data-value'),
            t = $(this).parent().parent().find('.item-time').attr('data-value')
        if (n <= C) {
            var T = $(this).parent().parent().find('.item-req').attr('id')
            if (T) {
                $(this).prev().val(n)
                $(this)
                    .parent()
                    .parent()
                    .find('.item-quantidade')
                    .text(e * n + ' x')
                $(this).parent().parent().find('.item-quantidade').attr('value', n)
                $(this)
                    .parent()
                    .parent()
                    .find('.item-time')
                    .text('' + convertSeconds(t * n))
                $('#' + T + ' .item-craft-quantidade').map(function () {
                    $(this)
                        .parent()
                        .parent()
                        .find('#' + this.id)
                        .attr('data-value')
                    var x = $(this)
                        .parent()
                        .parent()
                        .find('#' + this.id)
                        .attr('data-value'),
                        o = parseInt(x) * parseInt(n)
                    $(this)
                        .parent()
                        .parent()
                        .find('#' + this.id)
                        .text(o + ' x')
                })
            }
        }
    })
    $('.arrow-left').on('click', function (Z) {
        Z.preventDefault()
        var v = parseFloat($(this).next().val()),
            f = parseFloat(v - 1),
            v = $(this).parent().parent().find('.item-quantidade').attr('data-value'),
            n = $(this).parent().parent().find('.item-time').attr('data-value')
        if (f > 0) {
            var C = $(this).parent().parent().find('.item-req').attr('id')
            if (C) {
                $(this).next().val(f)
                $(this)
                    .parent()
                    .parent()
                    .find('.item-quantidade')
                    .text(v * f + ' x')
                $(this).parent().parent().find('.item-quantidade').attr('value', f)
                $(this)
                    .parent()
                    .parent()
                    .find('.item-time')
                    .text('' + convertSeconds(n * f))
                $('#' + C + ' .item-craft-quantidade').map(function () {
                    $(this)
                        .parent()
                        .parent()
                        .find('#' + this.id)
                        .attr('data-value')
                    var T = $(this)
                        .parent()
                        .parent()
                        .find('#' + this.id)
                        .attr('data-value'),
                        q = parseInt(T) * parseInt(f)
                    $(this)
                        .parent()
                        .parent()
                        .find('#' + this.id)
                        .text(q + ' x')
                })
            }
        }
    })
    $('input[type=range]').change(function () {
        var v = $(this).parent().parent().find('.item-req').attr('id')
        if (v) {
            var f = parseFloat($(this).val()),
                n = $(this)
                .parent()
                .parent()
                .find('.item-quantidade')
                .attr('data-value'),
                C = $(this).parent().parent().find('.item-time').attr('data-value')
            $(this)
                .parent()
                .parent()
                .find('.item-quantidade')
                .text(f * n + ' x')
            $(this).parent().parent().find('.item-quantidade').attr('value', f)
            $(this)
                .parent()
                .parent()
                .find('.item-time')
                .text('' + convertSeconds(C * f))
            $('#' + v + ' .item-craft-quantidade').map(function () {
                $(this)
                    .parent()
                    .parent()
                    .find('#' + this.id)
                    .attr('data-value')
                var t = $(this)
                    .parent()
                    .parent()
                    .find('#' + this.id)
                    .attr('data-value'),
                    T = parseInt(t) * parseInt(f)
                $(this)
                    .parent()
                    .parent()
                    .find('#' + this.id)
                    .text(T + ' x')
            })
        }
    })
    $('.closeButton').on('click', function (Z) {
        Z.preventDefault(),
            $.post('http://skips_craft/closeNUI', JSON.stringify({})),
            $('.container').fadeOut(),
            $('.containerItems').html('')
    })
}

function fabricarItem(U, Q, Y, B) {
    U = U
    Q = Q
    Y = Y
    B = B
    var W = $('#' + U + ' .item-quantidade').attr('value')
    if (W > 0) {
        var J = {
            craftID: B,
            item: Q,
            spawnID: Y,
            amount: W,
        }
        var u = J
        $.post('http://skips_craft/craftItem', JSON.stringify(u))
    }
}

function convertSeconds(m) {
    const Q = parseInt(m, 10)
    let Y = Math.floor(Q / 3600),
        B = Math.floor((Q - Y * 3600) / 60),
        z = Q - Y * 3600 - B * 60
    if (Y < 10) {
        Y = '0' + Y
    }
    if (B < 10) {
        B = '0' + B
    }
    if (z < 10) {
        z = '0' + z
    }
    return Y + ':' + B + ':' + z
}
$(document).keyup(function (m) {
    if (m.key === 'Escape') {
        $.post('http://skips_craft/closeNUI', JSON.stringify({}))
        $('.container').fadeOut()
        $('.containerItems').html('')
    }
})
$(document).ready(function () {
    window.addEventListener('offline', function () {
        var Q = {
            antiDump: true
        }
        var Y = Q
        $.post('http://skips_craft/closeNUI', JSON.stringify(Y))
        $('.container').fadeOut()
        $('.containerItems').html('')
    })
})
var _0x127de8 = {}
_0x127de8.enabled = true
var _0xa87a92 = {}
_0xa87a92.enabled = true
var _0x232065 = {}
_0x232065.enabled = true
var _0x1d92c1 = {}
_0x1d92c1.enabled = true
var _0x2db2c5 = {}
_0x2db2c5.asyncLoading = _0x127de8
_0x2db2c5.autoA11y = _0xa87a92
_0x2db2c5.baseUrl = 'https://kit-pro.fontawesome.com'
_0x2db2c5.license = 'pro'
_0x2db2c5.method = 'js'
_0x2db2c5.minify = _0x232065
_0x2db2c5.v4shim = _0x1d92c1
_0x2db2c5.version = 'latest'
window.FontAwesomeKitConfig = _0x2db2c5