/**
 * Created by laurent on 09/02/2014.
 */
var Inscription = Backbone.View.extend({

    el: '#contenerInscription',

    events: {
        'click #submitInscription' : 'sendInscription'
    },

    initialize: function(){
        console.log("Initialisation de la vue d'inscription");

        $.validator.addMethod("nom",function(value,element){
            return this.optional(element) || /^[a-zA-Z_-]{3,30}$/.test(value);
        },"Champ incorrect (entre 3 et 30 lettres et \"-\")");

        $.validator.addMethod("nomWithNumber",function(value,element){
            return this.optional(element) || /^[a-zA-Z0-9_-]{3,30}$/.test(value);
        },"Champ incorrect (plus de 3 lettres et/ou chiffres et/ou \"-\" \"_\")");

        $.validator.addMethod("confirmPassword",function(value,element){

            return this.optional(element) || ($('#password').val() == value);
        },"Confirmation du mot de passe incorrecte");

        $.validator.messages.gender = "Champs requis."

        $("#contenerInscription").validate({
            rules: {
                nom: "required nom",
                prenom: "required nom",
                password: "required nomWithNumber",
                confirmPassword: "required confirmPassword",
                gender: "required",
                email: {
                    required:true,
                    email: true,
                    remote:{
                        url:"/lizbox/api/utilisateurs/emailFree",
                            type:"post",
                            dataType:"json",
                            data:{
                            email: function(){
                                return $('#email').val();
                            }
                        }
                    }
                },
                pseudo: {
                    required:true,
                    nomWithNumber: true,
                    remote:{
                        url:"/lizbox/api/utilisateurs/pseudoFree",
                        type:"post",
                        dataType:"json",
                        data:{
                            pseudo: function(){
                                return $('#pseudo').val();
                            }
                        }
                    }
                }
            },
            messages: {
                nom : {
                    required:"Champs requis."
                },
                prenom : {
                    required:"Champs requis."
                },
                password : {
                    required:"Champs requis."
                },
                confirmPassword : {
                    required:"Champs requis."
                },
                gender: {
                    required:"Champs requis."
                },
                email: {
                    required:"Champs requis.",
                    email:"Une adresse mail est attendue.",
                    remote: "Email déjà utilisé sur Lizbox."
                },
                pseudo: {
                    required:"Champs requis.",
                    remote:"Pseudo déjà utilisé sur Lizbox."
                }
            }
        });
    },

    render : function() {

    },

    sendInscription : function(e){
        if ($('#contenerInscription').valid()){
            e.preventDefault();
            this.model.save({
                nom: $('#nom').val(),
                prenom: $('#prenom').val(),
                male: parseInt($('input[name=gender]').val()),
                pseudo: $('#pseudo').val(),
                email: $('#email').val(),
                password: $('#password').val(),
                role: 'ROLE_FREE',
                inscription: parseInt(moment().format("X")),
                actif:1

            },{
                wait:true,
                success : function (model){
                    window.location.href = "/lizbox/login?inscriptionSuccess";
                },
                error : function(model,response){
                    alert("error server");
                }
            });
        }

    }
});
