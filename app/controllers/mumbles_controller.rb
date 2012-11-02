class MumblesController < ApplicationController
  # GET /mumbles
  # GET /mumbles.json
  def index
    @mumbles = Mumble.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mumbles }
    end
  end

  # GET /mumbles/1
  # GET /mumbles/1.json
  def show
    @mumble = Mumble.find(params[:id])
    
    @array_a = mumble_generator @mumble.string_a
    @array_b = mumble_generator @mumble.string_b

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mumble }
    end
  end

  # GET /mumbles/new
  # GET /mumbles/new.json
  def new
    @mumble = Mumble.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mumble }
    end
  end

  # GET /mumbles/1/edit
  def edit
    @mumble = Mumble.find(params[:id])
  end

  # POST /mumbles
  # POST /mumbles.json
  def create
    @mumble = Mumble.new(params[:mumble])

    respond_to do |format|
      if @mumble.save
        format.html { redirect_to @mumble, notice: 'Mumble was successfully created.' }
        format.json { render json: @mumble, status: :created, location: @mumble }
      else
        format.html { render action: "new" }
        format.json { render json: @mumble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mumbles/1
  # PUT /mumbles/1.json
  def update
    @mumble = Mumble.find(params[:id])

    respond_to do |format|
      if @mumble.update_attributes(params[:mumble])
        format.html { redirect_to @mumble, notice: 'Mumble was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mumble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mumbles/1
  # DELETE /mumbles/1.json
  def destroy
    @mumble = Mumble.find(params[:id])
    @mumble.destroy

    respond_to do |format|
      format.html { redirect_to mumbles_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def mumble_generator string_a
    final_array = []
    methods_to_try = [
      :dump,
      :encode,
      :oct,
      :ord,
      :tojis,
      :tolocale,
      :tosjis,
      :toutf16,
      :toutf32,
      :toutf8,
      'Base64.encode64(try)',
      'Base64.decode64(try)',
      'URI.escape(try)',
      'URI.unescape(try)',
      'OpenSSL::Digest::DSS.digest(try)',
      'OpenSSL::Digest::DSS1.digest(try)',
      'OpenSSL::Digest::MD2.digest(try)',
      'OpenSSL::Digest::MDC2.digest(try)',
      'OpenSSL::Digest::RIPEMD160.digest(try)',
      'OpenSSL::Digest::MD4.digest(try)',
      'OpenSSL::Digest::MD5.digest(try)',
      'OpenSSL::Digest::SHA.digest(try)',
      'OpenSSL::Digest::SHA1.digest(try)',
      'OpenSSL::Digest::SHA224.digest(try)',
      'OpenSSL::Digest::SHA256.digest(try)',
      'OpenSSL::Digest::SHA384.digest(try)',
      'OpenSSL::Digest::SHA512.digest(try)',
      'BCrypt::Password.create(try)'
    ]

    Encoding.list.each do |e|
      to_try = "try.force_encoding('#{e.to_s}')"
      methods_to_try << to_try
    end

    methods_to_try.each do |method|
      begin
        case method
        when Symbol
          result = string_a.send method
        when String
          try = string_a
          result = eval method
        end
      rescue Exception => e
        result = "error (#{e})"
      end
      final_array.push [method, result]
    end
    final_array
  end
  
end
