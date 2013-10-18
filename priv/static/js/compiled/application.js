// Generated by CoffeeScript 1.6.3
(function() {
  $(function() {
    return window.Checkout = (function() {
      var createStreams, initialize, initializeTextTransformer, updateText;
      initialize = function() {
        return createStreams();
      };
      createStreams = function() {
        var checkoutElem, checkoutStream, resource;
        resource = $(".resource");
        checkoutElem = $(resource).find('.checkout');
        checkoutStream = checkoutElem.asEventStream('click');
        return initializeTextTransformer(checkoutStream);
      };
      initializeTextTransformer = function(checkoutStream) {
        return checkoutStream.map(function(event) {
          return event.target;
        }).onValue(function(target) {
          return updateText(target);
        });
      };
      updateText = function(target) {
        return console.log("HI");
      };
      return initialize();
    })();
  });

}).call(this);