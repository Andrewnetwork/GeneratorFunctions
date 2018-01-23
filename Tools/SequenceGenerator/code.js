var tst = new Vue({
    el: '#container',
    data: {
      sequence: "0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987"
    },
    methods: {
        genSequence: function () {
        var roots = this.sequence.split(",").map(x => x.replace(/\D/g,''));
        var res = this.seqGen(roots);
        var outHTML = this.$refs["pyramid"];
        outHTML.innerHTML = "";
        var spacer = 1;
        
        
        //outHTML.appendChild( this.createSeqHTML(0,seqLs) ) ;
        /*
        while(res){
            outHTML.appendChild( this.createSeqHTML(spacer,res) )
            res = this.seqDeriv(res);
            spacer+=1;
        }*/
      },
      seqGen : function(ls){
        if(ls.length <= 0){
            return false;
        }
        else if (ls.length == 1){
            return ls[0];
        }
        else{
            var outLs = []
            for(i=0; i<(ls.length-1); i++){
                outLs.push(ls[i+1] - ls[i]);
            }
            return outLs;
        }
      },
      createSeqHTML : function(nSpacers,ls){
        var row = document.createElement("div");
        row.setAttribute("class","row");
       
        for(i=0;i<nSpacers;i++){
            var spacerHTML = document.createElement("div")
            spacerHTML.setAttribute("class","spacer")
            spacerHTML.innerHTML ="&nbsp;"

            row.appendChild(spacerHTML);
        }

        for(i=0;i<ls.length;i++){
            var col = document.createElement("div");
            col.setAttribute("class","element");
            col.innerHTML = ls[i];
            row.appendChild(col);
        }
        
        return row;
      },
      loadPriorSeq:function(ref){
        this.sequence = ref.target.innerHTML;
        this.genPyramid();
      },
      createPriorSeqButton:function(seq){
        var elem = document.createElement("div");
        elem.setAttribute("class","seq");
        
        var textDiv = document.createElement("div");
        textDiv.innerHTML = seq;
        textDiv.setAttribute("class","seqText");
        textDiv.onclick = this.loadPriorSeq;

        elem.appendChild(textDiv)

        var xBox = document.createElement("div");
        xBox.setAttribute("class","xBox");
        xBox.innerHTML = "X";
        xBox.onclick = this.removePriorSeq;
        
        elem.appendChild(xBox);

        this.$refs["priorSeq"].appendChild(elem);
      },
      clickGen:function(){
        this.genPyramid();
        this.createPriorSeqButton(this.sequence);
      },
      removePriorSeq:function(ref){
        var parElm = ref.target.parentElement
        parElm.parentElement.removeChild(parElm)
      }
    },
    mounted:function(){
        // Loads the default pyramid.
        this.createPriorSeqButton("1, 2, 3, 4, 5, 6, 7, 8, 9, 10");
        this.createPriorSeqButton("2, 4, 6, 8, 10, 12, 14, 16, 18, 20");
        this.createPriorSeqButton("0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100");
        this.createPriorSeqButton("0, 1, 16, 81, 256, 625, 1296, 2401, 4096, 6561, 10000");
        this.createPriorSeqButton("0, 1, 32, 243, 1024, 3125, 7776, 16807, 32768, 59049, 100000");
        this.createPriorSeqButton("0, 1, 32, 243, 1024, 3125, 7776, 16807, 32768, 59049, 100000");
        this.createPriorSeqButton("1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5, 4, 3, 2, 1");
        this.createPriorSeqButton("0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987");
        this.genPyramid()
    }
  })
