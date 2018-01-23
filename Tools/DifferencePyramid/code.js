var tst = new Vue({
    el: '#container',
    data: {
      sequence: "1,2,3,4,5"
    },
    methods: {
        genPyramid: function () {
        var seqLs = this.sequence.split(",");
        var res = this.seqDeriv(seqLs)
        var outHTML = this.$refs["pyramid"]
        outHTML.innerHTML = ""
        var spacer = 1

        outHTML.appendChild( this.createSeqHTML(0,seqLs) ) 
        
        while(res){
            outHTML.appendChild( this.createSeqHTML(spacer,res) )
            res = this.seqDeriv(res)
            spacer+=1
        }
        
      },
      seqDeriv : function(ls){
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
            return outLs
        }
      },
      createSeqHTML : function(nSpacers,ls){
        var row = document.createElement("div")
        row.setAttribute("class","row")
       
        
        for(i=0;i<nSpacers;i++){
            var spacerHTML = document.createElement("div")
            spacerHTML.setAttribute("class","spacer")
            spacerHTML.innerHTML ="&nbsp;"
            
            row.appendChild(spacerHTML)
        }

        for(i=0;i<ls.length;i++){
            var col = document.createElement("div")
            col.setAttribute("class","element")
            col.innerHTML = ls[i]
            row.appendChild(col)
        }
        
        return row
      }
    }
  })
