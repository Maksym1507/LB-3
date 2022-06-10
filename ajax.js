var ajax = new XMLHttpRequest();

function textFunc() {
    ajax.onreadystatechange = function() {
        if (ajax.readyState === 4) {
            if (ajax.status === 200) {
                console.dir(ajax.responseText);
                document.getElementById("result").innerHTML = ajax.response;
            }
        }
    }
    var genre = document.getElementById("genre").value;
    ajax.open("get", "genre.php?genre=" + genre);
    ajax.send();
}

function XMLFunc() {
    ajax.onreadystatechange = function() {
        if (ajax.readyState === 4) {
            if (ajax.status === 200) {
                
                console.dir(ajax);
                let rows = ajax.responseXML.firstChild.children;
                let result = "<table border ='1'><tr><th>Actor</th><th>Film</th><th>Date</th><th>Country</th><th>Quality</th><th>Resolution</th><th>Codec</th><th>Producer</th><th>Director</th><th>Carrier</th></tr>";
                console.dir(rows.length);
                for (var i = 0; i < rows.length; i++) {
                    result += "<tr>";
                    result += "<td>" + rows[i].children[0].firstChild.nodeValue + "</td>";
                    result += "<td>" + rows[i].children[1].firstChild.nodeValue + "</td>";
                    result += "<td>" + rows[i].children[2].firstChild.nodeValue + "</td>";
                    result += "<td>" + rows[i].children[3].firstChild.nodeValue + "</td>";
                    result += "<td>" + rows[i].children[4].firstChild.nodeValue + "</td>";
                    result += "<td>" + rows[i].children[5].firstChild.nodeValue + "</td>";
                    result += "<td>" + rows[i].children[6].firstChild.nodeValue + "</td>";
                    result += "<td>" + rows[i].children[7].firstChild.nodeValue + "</td>";
                    result += "<td>" + rows[i].children[8].firstChild.nodeValue + "</td>";
                    result += "<td>" + rows[i].children[9].firstChild.nodeValue + "</td>";
                    result += "</tr>";
                }
                document.getElementById("result").innerHTML = result;
            }
        }
    }
    var actor = document.getElementById("actor").value;
    ajax.open("get", "actor.php?actor=" + actor);
    ajax.send();
}

function JSONFunc() {
    ajax.onreadystatechange = function() {
        let rows = JSON.parse(ajax.responseText);
        console.dir(rows);
        if (ajax.readyState === 4) {
            if (ajax.status === 200) {
                console.dir(ajax);
                
                let result = "<table border ='1'><tr><th>Film</th><th>Date</th><th>Country</th><th>Quality</th><th>Resolution</th><th>Codec</th><th>Producer</th><th>Director</th><th>Carrier</th></tr>";
                for (var i = 0; i < rows.length; i++) {
                    result += "<tr>";
                    result += "<td>" + rows[i].name + "</td>";
                    result += "<td>" + rows[i].date + "</td>";
                    result += "<td>" + rows[i].country + "</td>";
                    result += "<td>" + rows[i].quality + "</td>";
                    result += "<td>" + rows[i].resolution + "</td>";
                    result += "<td>" + rows[i].codec + "</td>";
                    result += "<td>" + rows[i].producer + "</td>";
                    result += "<td>" + rows[i].director + "</td>";
                    result += "<td>" + rows[i].carrier + "</td>";
                    result += "</tr>";
                }
                document.getElementById("result").innerHTML = result;
            }
        }
    };
    var date_1 = document.getElementById("date_1").value;
    var date_2 = document.getElementById("date_2").value;
    ajax.open("get", "date.php?date_1=" + date_1 + "&date_2=" + date_2);
    ajax.send();
}