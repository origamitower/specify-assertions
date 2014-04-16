// Copyright (c) 2014 Quildreen Motta <quildreen@gmail.com>
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation files
// (the "Software"), to deal in the Software without restriction,
// including without limitation the rights to use, copy, modify, merge,
// publish, distribute, sublicense, and/or sell copies of the Software,
// and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
var spec = require('hifive')();
var alright = global.alright = require('../../lib');
var claire = require('claire');
// Aliases
var _ = alright.divergence;
var $ = alright;
var t = claire.data;
var forAll = claire.forAll;
// Specification
module.exports = spec('Divergence', function (it, spec$2) {
    spec$2('divergence()', function (it$2) {
        it$2('Should make a divergence with the given message.', forAll(t.Id).satisfy(function (a) {
            return alright.verify(alright.equal(a)(_.divergence(a).make({}).toString()));
        }).asTest());
        it$2('Should not be invertible', forAll(t.Str).satisfy(function (a) {
            return alright.verify($.raise(Error)(function () {
                _.divergence(a).inverse();
            }));
        }).asTest());
    });
});